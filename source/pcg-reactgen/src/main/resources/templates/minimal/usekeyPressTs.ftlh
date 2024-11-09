const useKeyPress = (saveDataFn: any, isValid: boolean) => {
    const handleKeyPress = (event: KeyboardEvent) => {
        if (event.ctrlKey && event.key === 's') {
            event.preventDefault();
            if (isValid) {
                saveDataFn();
            }
        }
    };
    return handleKeyPress;
};

export default useKeyPress;