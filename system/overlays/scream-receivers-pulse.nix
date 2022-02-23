self: super: {
    scream-receivers = super.scream-receivers.override {
        pulseSupport = true;
    };
}