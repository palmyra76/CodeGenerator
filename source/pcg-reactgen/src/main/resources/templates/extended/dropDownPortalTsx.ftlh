import { createPortal } from 'react-dom';
import { ClickAwayListener } from '@mui/material';

const DropdownPortal = ({ open, onClose, statusList, onStatusChange, position }) => {
    if (!open || !position) return null;

    const { top } = position;
    const adjustedTop = top;

    return createPortal(
        <ClickAwayListener onClickAway={onClose}>
            <div className="dropdown-content"
                style={{
                    position: 'absolute',
                    top: adjustedTop,
                    right: "5.5%"
                }}>
                <ul>
                    {statusList.map((item: any, _index: any) => (
                        <li key={item.id} onClick={() => onStatusChange(item.id)}>
                            <span className='dropdown-text'>{item.name}</span>
                        </li>
                    ))}
                </ul>
            </div>
        </ClickAwayListener>,
        document.body
    );
};

export default DropdownPortal;