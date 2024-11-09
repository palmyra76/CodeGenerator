import { toast } from "react-toastify"

const showServerErrorToast = () => {
    toast.error("Something went wrong Please try again later.. ")
}

export { showServerErrorToast }