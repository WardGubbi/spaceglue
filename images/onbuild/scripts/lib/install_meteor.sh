# First, try to get the Meteor version from the .meteor/release file in the app.
if [ -z "$METEOR_RELEASE" ]; then
  METEOR_RELEASE="$(grep "^METEOR@" .meteor/release | sed 's/^METEOR@//;')"
fi

# Would like to use a cached Meteor here at some point, but for now,
# download the installer, attempting to use the preferred version, from
# the install.meteor.com script
if true; then
  curl -sL "https://install.meteor.com/?release=${METEOR_RELEASE}" \
    > /tmp/install_meteor.sh

  if [ -z "${METEOR_RELEASE}" ]; then
    # Read it from the install file.
    echo "Setting METEOR_RELEASE from the installer"
    eval "METEOR_RELEASE=$( \
      cat /tmp/install_meteor.sh | \
      grep '^RELEASE="[0-9\.a-z-]\+"$' | \
      sed 's/RELEASE=//;s/"//g' \
    )"
  fi

  echo "=> Running the ${METEOR_RELEASE} installer..."
  cat /tmp/install_meteor.sh | sed s/--progress-bar/-sL/g | /bin/sh
fi
