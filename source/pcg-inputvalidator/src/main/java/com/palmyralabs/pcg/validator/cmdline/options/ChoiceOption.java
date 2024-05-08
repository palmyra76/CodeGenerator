package com.palmyralabs.pcg.validator.cmdline.options;

import org.apache.commons.cli.Option;

import org.apache.commons.cli.Option;

public class ChoiceOption extends Option {
    private String[] choices;

    public ChoiceOption(String opt, String longOpt, boolean hasArg, String description) {
        super(opt, longOpt, hasArg, description);
    }

    public String[] getChoices() {
        return choices;
    }

    public void setChoices(String[] choices) {
        this.choices = choices;
    }
}

