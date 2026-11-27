Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806221;
	b=jMGJ3S6tGow8J6dfoo1Pictf8XxMXDEvsZ9BozSdYclSwx9nKRjhnpri5/AxdFcyeWY/
	 UDk/UPBJtl/GI2WRN+F6i+y03etkTD7goTk4wYYCJD5cHwzfCdB/N9+rVYAztLT50ZLSZ
	 nlxF+1m6JPkNtmP4DtXSY13AkWKvM5PqgwJIPMZPAvLsj8cAP/GD9iQJgLbn4ingsISeR
	 Xk5qjp9rD5oXgmtYvlhbWVUHeLgp7AwT0QqPCiaK5CNHLwlOzliKp0FOYmg07JADQtyN2
	 rEk+jQX3HMmqdQj8Lh0a0bzV3lXEZdvXwe3SdoQw6BbI9igZYy1+JXLAIleNNZct60A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806221;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+2ZvEYGeVCfgxKPTlphddhG9+ZbHHqSDSOpz7nwafmo=;
	b=J0OVCRInNM2Uwc8XAg0cw7FwTmsuWyV/cdB0GRhPtCDqnIEFAa0kTGvhxZc2eHjwIUzF
	 Xb5atlfVMDnzvE1fxlQbmVs6vSJRDwJmIYMMrs0JiIM1AQl8KzUJKA9NPF6ajy/4NnM2t
	 healS3p8pNf+Mf73zaOI/i1xSmzTPJpRPm5ZomIXvZbm7uVebN8UaYq5+Al4iUNXdFTyl
	 pZd6lMCbIMBWwbU46THLGQgYcRncrkMl4GZkQ81anWgS8tgXNkNrElLal0riAYYQVxzFd
	 FiHj8b3l3rexin4S7kbWXHZCOIosJXJuAVbWX/Q+7ukotmr/e11PI2vBpMtg71lXbYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLq1DnIu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FCD606A31C;
	Fri, 27 Nov 2026 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLq1DnIu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEBA1F00897;
	Fri, 27 Nov 2026 19:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795806220;
	bh=+2ZvEYGeVCfgxKPTlphddhG9+ZbHHqSDSOpz7nwafmo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KLq1DnIuxSqW2fOSEvedUs9a3mLegWdYG+NkkuG28ZdGWeB8/T6kPLYk12QZm23Iw
	 5h0f1V/ofBwhywZixwYJkJvfGvuByQUbaIILPjo4DVqI1OT+C51YlTR5+JEFt3gBQH
	 8X30Xk46VExkNUpU49Mts2wvB8J5w1QAC5dCIpvZ/c+CkxL6hVZRQF/jP2a1qL3kE5
	 jy5R+xRMsx6LMJcjS7j/Gpcb+K45qyWv1t7ibveBtUgQk7DqWV/v2IRglqW2kI2AAi
	 cl68/QPyU8PZJhi88k3ef1uq9sj3twqJqBODzKQq5lyddG9kRhSVcNioRFfavPPht5
	 svvId9TSR6dZA==
Subject: Re: [PATCH net-next V3 1/5] net/mlx5: nodnic: Introduce the
 mlx5_nodnic driver
From: netdev-bot+sashiko@kernel.org
To: tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 cjubran@nvidia.com, gal@nvidia.com, linux-kernel@vger.kernel.org,
 shshitrit@nvidia.com, horms@kernel.org
Date: Fri, 27 Nov 2026 19:03:39 +0000
Message-ID: <179580621973.3135.8962207596415842315@kernel.org>
In-Reply-To: <20261126182448.707782-2-tariqt@nvidia.com>
References: <20261126182448.707782-2-tariqt@nvidia.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 11 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 7

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mlx5_core's sync FW reset code
  (drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c) lists PCI ID…
- [Medium] mlx5_nodnic_update_carrier() calls netif_carrier_event()
  whenever the HW state equals the current carrier state, and that…
- [Medium] In mlx5_nodnic_dev_init(), any failure of
  mlx5_nodnic_set_nic_interface() jumps to disable_nic ->…
- [Medium] mlx5_nodnic_init_working_buffer() allocates size = 1U <<
  dev->log_working_buffer_size bytes and gives that buffer's DMA address…
- [Low] The commit message describes mlx5_nodnic as a generic driver for
  'any resource-constrained instantiation of a ConnectX NIC'.
- [Low] One IFC layout, nodnic_q_addr_l.log_size, is used with two
  different units and nothing documents the difference.
- [Low] mlx5_nodnic_init_working_buffer() programs PORT_WORK_BUF_ADDR_L
  through mlx5_nodnic_write_ring_addr().
- [Low] mlx5_nodnic_read_mac_address() builds the MAC from raw FW dwords
  with u64_to_ether_addr(), and mlx5_nodnic_build_netdev() passes it…
- [Low] Several reserved fields in nodnic_ifc.h have names that break the
  mlx5_ifc reserved_at_<bit offset> convention: - In…
- [Low] mlx5_nodnic_open_queues() acquires the VSC context with
  mlx5_nodnic_vsc_context_acquire().
- [Low] net/mlx5: nodnic: unused definitions and non-static local helpers

--

net/mlx5: nodnic: Introduce the mlx5_nodnic driver

This commit adds mlx5_nodnic, a PCI driver for DRAM-less ConnectX NIC
functions. It does FLR, firmware readiness polling, NODNIC interface
selection and capability discovery over a PCI config-space VSC gateway.
It then programs the rings, the event IRQ and the MAC address, and
registers a netdev with ndo_open/ndo_stop.

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
> new file mode 100644
> index 0000000000000..79cd2527966c4
> --- /dev/null
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
> @@ -0,0 +1,840 @@

[ ... ]

> +static u32 mlx5_nodnic_calc_ring_size(struct mlx5_nodnic_core_dev *dev,
> +				      int stride)
> +{
> +	u32 ring_size = MLX5_NODNIC_RING_ENTRIES * stride;
> +	u32 max_supported = 1U << dev->log_max_ring_size;
> +
> +	return min(ring_size, max_supported);
> +}
> +
> +static int mlx5_nodnic_write_ring_size(struct mlx5_nodnic_core_dev *dev,
> +				       int offset, int size)
> +{
> +	__be32 addr_l;
> +	int err;
> +
> +	err = mlx5_nodnic_vsc_cfg_read_be32(dev->vsc_ctx, offset, &addr_l);
> +	if (err) {
> +		mlx5_nodnic_core_err(dev, "failed to read ring size: %d\n",
> +				     err);
> +		return err;
> +	}
> +
> +	MLX5_SET(nodnic_q_addr_l, &addr_l, log_size, ilog2(size));

[Severity: Low]
What unit does the send/receive ring log_size field use? Here size is a
byte count. For the SQ that is 1024 * 64, so log 16. For the RQ it is
1024 * 16, so log 14. mlx5_nodnic_calc_ring_size() also compares the
byte count with 1 << log_max_ring_size.

mlx5_nodnic_read_cq_ring_size() reads the same nodnic_q_addr_l layout
from cq_addr_l, but treats it as log2 of an entry count:

	log_cq_size = MLX5_GET(nodnic_q_addr_l, &cq_addr_l, log_size);
	cq->num_entries = 1ULL << log_cq_size;

If the ring field counts entries, the device would see a 65536-entry SQ
and a 16384-entry RQ. Only 64KB and 16KB are allocated.

Could the unit used by each register be documented, or the conversion
checked?

[ ... ]

> +int mlx5_nodnic_init_working_buffer(struct mlx5_nodnic_core_dev *dev)
> +{
> +	struct mlx5_nodnic_ring *work_buf = &dev->priv->working_buffer;
> +	u32 size = 1U << dev->log_working_buffer_size;

[Severity: Medium]
Is log_working_buffer_size really log2 of a byte count? It is a 3-bit
field in nodnic_gen_cfg_caps, so in bytes this buffer could never be
larger than 128 bytes.

The iPXE/FlexBoot NODNIC implementation (nodnic_port_allocate_eq())
treats this capability as log2 in KB, (1 << log) * 1024. If the hardware
uses KB, any value of 3 or more gives firmware a buffer smaller than it
expects. Here dma_alloc_coherent() only backs a single page.

The data path patch later in the series sets dma_en and bus mastering on
every open. Once that happens, could firmware DMA run past this buffer
into adjacent memory?

> +	int err;
> +
> +	err = mlx5_nodnic_alloc_ring(dev, work_buf, size);
> +	if (err)
> +		return err;
> +
> +	err = mlx5_nodnic_write_ring_addr(dev, work_buf->dma_handle,
> +					  MLX5_NODNIC_PORT_WORK_BUF_ADDR_H,
> +					  MLX5_NODNIC_PORT_WORK_BUF_ADDR_L);

[Severity: Low]
mlx5_nodnic_write_ring_addr() does a read-modify-write of the low
register using the nodnic_q_addr_l layout:

	MLX5_SET(nodnic_q_addr_l, &addr_l, q_addr_l,
		 lower_32_bits(dma_handle) >> 12);

That keeps whatever low 12 bits are read back from the device. However,
nodnic_ifc.h defines working_buffer_addr_l as a plain 32-bit field:

	u8 working_buffer_addr_l[0x20];

cq_addr_l, by contrast, does use struct mlx5_ifc_nodnic_q_addr_l_bits.

Is the IFC definition wrong here? If it is right, could non-zero low bits
left in the register end up in the address given to firmware?

[ ... ]

> +static int mlx5_nodnic_open_queues(struct mlx5_nodnic_core_dev *dev)
> +{
> +	struct mlx5_nodnic_vsc_ctx *vsc_ctx = dev->vsc_ctx;
> +	int err;
> +
> +	/* one doorbell record shared by both SQ and RQ */
> +	err = mlx5_nodnic_alloc_dbr(dev, &dev->priv->dbr);
> +	if (err)
> +		return err;
> +
> +	err = mlx5_nodnic_vsc_context_acquire(vsc_ctx);
> +	if (err)
> +		goto err_free_dbr;
> +
> +	err = mlx5_nodnic_open_sq(dev);

[Severity: Low]
This isn't a bug, but mlx5_nodnic_vsc_context_acquire() takes
pci_cfg_access_lock() and the hardware VSC semaphore. Both stay held
across every GFP_KERNEL dma_alloc_coherent() call: SQ, RQ, CQ ring, CQ
DBR and working buffer. Later in the series they are also held across
kvcalloc() and request_irq().

While they are held, userspace config-space access (lspci, setpci,
sysfs config) blocks in pci_wait_cfg(). Other agents polling the
semaphore keep retrying.

Could the buffers be allocated before the acquire, as priv->dbr already
is, so that only the register writes happen under the lock?

[ ... ]

> +static void mlx5_nodnic_update_carrier(struct mlx5_nodnic_priv *priv,
> +				       __be32 event)
> +{
> +	u32 port_state = MLX5_GET(nodnic_port_event, &event, port_state);
> +	bool up = port_state == MLX5_NODNIC_PORT_STATE_ACTIVE;
> +
> +	/* Force re-notification if state is unchanged */
> +	if (up == netif_carrier_ok(priv->netdev)) {
> +		netif_carrier_event(priv->netdev);
> +		return;
> +	}

[Severity: Medium]
Should the re-notification happen only when up is true? Both
mlx5_nodnic_create_netdev() and mlx5_nodnic_close_locked() leave the
carrier off. So every ndo_open without a link goes down this path:

mlx5_nodnic_open()
  mlx5_nodnic_open_locked()
    mlx5_nodnic_refresh_carrier_locked()
      mlx5_nodnic_update_carrier()
        up == false == netif_carrier_ok()
        netif_carrier_event()

netif_carrier_event() increments both carrier_up_count and
carrier_down_count and fires linkwatch. That records a link flap that
never happened. Event IRQs that arrive while the link stays down would
do the same.

[ ... ]

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
> new file mode 100644
> index 0000000000000..b905deda56dcd
> --- /dev/null
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
> @@ -0,0 +1,867 @@

[ ... ]

> +	err = mlx5_nodnic_vsc_context_acquire(vsc_ctx);
> +	if (err)
> +		return err;
> +
> +	err = mlx5_nodnic_set_nic_interface(dev);
> +	mlx5_nodnic_vsc_context_release(vsc_ctx);
> +	if (err) {
> +		mlx5_nodnic_core_err(dev,
> +				     "mlx5_nodnic_set_nic_interface failed with error code %d\n",
> +				     err);
> +		goto disable_nic;
> +	}

[Severity: Medium]
Suppose the device doesn't advertise NO_DRAM_NIC. Then
mlx5_nodnic_check_supported() returns -EOPNOTSUPP inside
mlx5_nodnic_set_nic_interface(), and nothing has been written yet:

	err = mlx5_nodnic_check_supported(dev);
	if (err)
		return err;

Should that case still jump to disable_nic?

mlx5_nodnic_dev_cleanup() then writes
MLX5_NODNIC_ISEG_NIC_INTERFACE_DISABLED into nic_interface. It also
calls mlx5_nodnic_wait_fw_init(dev, "teardown"), which can poll for up
to MLX5_NODNIC_FW_INIT_TIMEOUT_MS (120 seconds).

On a device or firmware without NODNIC support, wouldn't a failed probe
leave the function's interface forced to DISABLED?

[ ... ]

> +	mac = ((u64)mac_h << 32) | mac_l;
> +
> +	u64_to_ether_addr(mac, dev->mac_address);
> +
> +	return 0;
> +}

[Severity: Low]
Should this MAC be checked with is_valid_ether_addr() before
mlx5_nodnic_build_netdev() passes it to eth_hw_addr_set()? A zero,
multicast or broadcast address from unprovisioned firmware would become
the netdev address unchanged.

mlx5_nodnic_netdev_ops also has no .ndo_validate_addr. In a similar case
mlx5e falls back to a random address.

[ ... ]

> +static const struct pci_device_id mlx5_nodnic_core_pci_table[] = {
> +	{ PCI_VDEVICE(MELLANOX, 0xc2d6) }, /* BlueField-4 nodnic rshim PF */
> +	{ }
> +};

[Severity: Low]
The commit message describes a generic driver:

  "... or any resource-constrained instantiation of a ConnectX NIC."

The only ID bound here is 0xc2d6, the BlueField-4 rshim/management PF.
Because of MODULE_DEVICE_TABLE, the module will autoload on every
BlueField-4 host. It claims BAR0, runs pcie_flr() and switches
nic_interface to NO_DRAM_NIC.

On remove, mlx5_nodnic_dev_cleanup() writes
MLX5_NODNIC_ISEG_NIC_INTERFACE_DISABLED. It does not restore the
previous value.

Could the commit message name the device that is bound, and say how
that function's behaviour changes on module load and unload?

> +
> +MODULE_DEVICE_TABLE(pci, mlx5_nodnic_core_pci_table);
> +
> +static struct pci_driver mlx5_nodnic_core_driver = {
> +	.name = KBUILD_MODNAME,
> +	.id_table = mlx5_nodnic_core_pci_table,
> +	.probe = mlx5_nodnic_probe_one,
> +	.remove = mlx5_nodnic_remove_one,
> +};

[Severity: Medium]
How does this interact with mlx5_core's sync firmware reset? In
drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c, 0xc2d6 is listed in
mgt_ifc_device_ids:

	{ PCI_VDEVICE(MELLANOX, 0xc2d6) }, /* BlueField4 MGT interface device ID */

So mlx5_check_dev_ids() skips this function and allows reset now. Then
mlx5_pci_link_toggle(), or mlx5_pci_reset_bus(), resets every function
on the bridge bus:

devlink reload action fw_activate
  mlx5_sync_reset_request_event()
    mlx5_is_reset_now_capable()
      mlx5_check_dev_ids()      /* 0xc2d6 skipped */
  mlx5_pci_link_toggle()
    pci_save_state(sdev); pci_cfg_access_lock(sdev);
    ... link toggle ...

Before this patch no in-tree driver bound 0xc2d6. Now a reset like this
wipes the NO_DRAM_NIC interface selection. It also wipes the ring, CQ,
DBR and working buffer addresses programmed through the VSC.

This pci_driver has no .err_handler (reset_prepare/reset_done), and
there is no re-init path. The health poller added later in the series
only marks the device INTERNAL_ERROR.

Would the nodnic netdev just stop working until the driver is rebound?

[ ... ]

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h
> new file mode 100644
> index 0000000000000..5939d39ddb9d1
> --- /dev/null
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h
> @@ -0,0 +1,317 @@

[ ... ]

> +struct mlx5_ifc_nodnic_iseg_initializing_word_bits {
> +	u8 initializing[0x1];
> +	u8 nic_interface_supported[0x7];
> +	u8 embedded_cpu[0x1];
> +	u8 driver_reset_ack[0x1];
> +	u8 recovery[0x1];
> +	u8 pre_boot_bios_hold[0x1];
> +	u8 initializing_state[0x4];
> +	u8 reset_state_machine[0x4];
> +	u8 reserved_at_14[0x1];
> +	u8 pre_boot_action[0x3];
> +	u8 reserved_at_17[0x8];
> +};

[Severity: Low]
This isn't a bug, but several reserved field names don't follow the
reserved_at_<bit offset> convention:

- reserved_at_17 here sits at bit 0x18.
- In nodnic_gen_cfg_caps, reserved_at_13 is at bit 0x14 and
  reserved_at_1a is at bit 0x1c.
- In nodnic_port_settings, reserved_at_104 is at bit 0x820.
- In nodnic_config_seg, reserved_at_24 is at bit 0x120.

Also, MLX5_NODNIC_ISEG_CMD_ADDR_L evaluates to 0, relative to the
nodnic_iseg_cmdq_addr_l sub-struct. The other MLX5_NODNIC_ISEG_*
macros are relative to the iseg.

[ ... ]

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
> --- /dev/null
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
> +// Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> +
> +#ifndef __MLX5_NODNIC_H__
> +#define __MLX5_NODNIC_H__
> +
> +#include <linux/mlx5/device.h>
> +#include <linux/pci.h>
> +#include <linux/sched.h>
> +
> +struct mlx5_nodnic_priv;
> +
> +#define mlx5_nodnic_core_dbg(__dev, format, ...)		\
> +	dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,	\
> +		 __func__, __LINE__, current->pid,		\
> +		 ##__VA_ARGS__)
> +
> +#define mlx5_nodnic_core_err(__dev, format, ...)		\
> +	dev_err((__dev)->device, "%s:%d:(pid %d): " format,	\
> +		__func__, __LINE__, current->pid,		\
> +	       ##__VA_ARGS__)
> +
> +#define mlx5_nodnic_core_warn(__dev, format, ...)		\
> +	dev_warn((__dev)->device, "%s:%d:(pid %d): " format,	\
> +		__func__, __LINE__, current->pid,		\
> +		##__VA_ARGS__)
> +
> +enum {
> +	MLX5_NODNIC_PORT_STATE_DOWN,
> +	MLX5_NODNIC_PORT_STATE_INITIALIZE,
> +	MLX5_NODNIC_PORT_STATE_ARMED,
> +	MLX5_NODNIC_PORT_STATE_ACTIVE,
> +};
> +
> +enum mlx5_nodnic_pci_status {
> +	MLX5_NODNIC_PCI_STATUS_DISABLED,
> +	MLX5_NODNIC_PCI_STATUS_ENABLED,
> +};
> +
> +enum mlx5_nodnic_device_state {
> +	NODNIC_DEVICE_STATE_UP = 1,
> +	NODNIC_DEVICE_STATE_INTERNAL_ERROR,
> +};
> +
> +enum mlx5_nodnic_msix {
> +	MLX5_NODNIC_DATA_MSIX,
> +	MLX5_NODNIC_EVENT_MSIX,
> +	MLX5_NODNIC_NUM_MSIX,
> +};
> +
> +struct mlx5_nodnic_vsc_ctx;
> +
> +struct mlx5_nodnic_core_dev {
> +	struct mlx5_nodnic_priv		*priv;
> +	struct device			*device;
> +	struct pci_dev			*pdev;
> +	bool				netdev_registered;
> +
> +	/* sync pci state */
> +	struct mutex			pci_status_mutex;
> +	enum mlx5_nodnic_pci_status	pci_status;
> +
> +	struct mlx5_init_seg __iomem	*iseg;
> +	phys_addr_t			bar_addr;
> +	struct mlx5_nodnic_vsc_ctx	*vsc_ctx;
> +	void __iomem			*uar_base;
> +
> +	u8				log_working_buffer_size;
> +	u8				log_max_ring_size;
> +	u8				log_uar_page_size;
> +	u32				send_ring0_uar_index;
> +
> +	u8				mac_address[6];
> +	u32				lkey;
> +
> +	int				event_irqn;
> +
> +	enum mlx5_nodnic_device_state	state;
> +};
> +
> +void mlx5_nodnic_start_health_poll(struct mlx5_nodnic_core_dev *dev);
> +void mlx5_nodnic_stop_health_poll(struct mlx5_nodnic_core_dev *dev);
> +
> +/*
> + * VSC-gated helpers: the caller must hold the VSC context across these calls.
> + */
> +int mlx5_nodnic_open_rq(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_open_sq(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_open_cq(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_init_working_buffer(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_enable_port(struct mlx5_nodnic_core_dev *dev);
> +void mlx5_nodnic_disable_port(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_get_fw_initializing(struct mlx5_nodnic_core_dev *dev,
> +				    u8 *initializing);
> +int mlx5_nodnic_set_nic_interface(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_check_supported(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_write_nic_interface(struct mlx5_nodnic_core_dev *dev,
> +				    int interface);
> +int mlx5_nodnic_read_config(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_validate_port_link_type(struct mlx5_nodnic_core_dev *dev);
> +int mlx5_nodnic_read_mac_address(struct mlx5_nodnic_core_dev *dev);
> +
> +/* end of VSC-gated helpers */
> +
> +#endif /* __MLX5_NODNIC_H__ */

[Severity: Low]
This isn't a bug, but some of the new definitions are unused, and
some helpers are exported with no reason to be.

struct mlx5_nodnic_working_buffer in en.h is never referenced.
mlx5_nodnic_priv declares working_buffer as a struct mlx5_nodnic_ring,
and the alloc and free paths treat it as one.

mlx5_nodnic_vsc_cfg_write_cpu32() is declared in nodnic_pci_vsc.h and
defined in nodnic_pci_vsc.c. Nothing calls it, in this patch or later
in the series.

Every VSC-gated helper declared in nodnic.h is called only from the
file that defines it, even at the end of the series.

In en_cfg.c these are:

- mlx5_nodnic_open_rq()
- mlx5_nodnic_open_sq()
- mlx5_nodnic_open_cq()
- mlx5_nodnic_init_working_buffer()
- mlx5_nodnic_enable_port()
- mlx5_nodnic_disable_port()

In main.c these are:

- mlx5_nodnic_get_fw_initializing()
- mlx5_nodnic_set_nic_interface()
- mlx5_nodnic_check_supported()
- mlx5_nodnic_write_nic_interface()
- mlx5_nodnic_read_config()
- mlx5_nodnic_validate_port_link_type()
- mlx5_nodnic_read_mac_address()

They all become global symbols for no benefit.

Could these be made static and their prototypes dropped from
nodnic.h? The note about holding the VSC context could move to the
definitions.

In this patch, mlx5_nodnic_enable_port() and
mlx5_nodnic_disable_port() have no callers at all. Making them static
here would trigger -Wunused-function. Would it be better to add them
in the patch that first uses them?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126182448.707782-1-tariqt%40nvidia.com
