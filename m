Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070700;
	b=TwFqS0CzcYRte/2L8YWgvOjcpM77Vbg6b1dv6tRp4mzu3N6cc0YewSZYA7Cx6KJFUA1Y
	 EwMwFsQ0eI4bk2TVg6DFJge5ii/FSKBaPO/CvnH0QFzDDx7X+Z7FzAHZYnWdJgPLwO5av
	 Ut2tHVmNGdujo+hKMw/IKMuSWZUuwixtHx97p6VYD3ljiTrRz3ovhZHmH+IadUkbeA7uo
	 TSDbzRGLyspVcUkrDDA8Qj+tyL88eMMrW/MfxWLOKPqd+lkOqbRYvsxMdL2zEaBW1iQ67
	 gZsaDPD0fQ03udMV852PbscLqJq0gZuCyIVHj75TIf4i6DfWwOyWumoCRsURrPaO52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070700;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ct3xVuraqIgSvW2uZojlh2VFdfDZrsrHXmqMp73nLbI=;
	b=eRN8FuEAx3Jt0iS78mD8qScZ4+H4pIQPSfMX6lU59XEN/KdLPb24Btn3abw6O0ECouzG
	 dCn3qWOe9piwGLQr1zC26Rzgtr882mgZj2T7PGQmTxl8Li2bw2F5T4AKxUfwasSCyNZWh
	 9SwnxfHbTChdnqvpnTFmmws3WKmj4ME6rP8hE+36DsmOLdsNROpxdSGa530UPu8Hs2Dch
	 tYKOwSqTZZP2ejrfah0EU0jxkM4HfDCH7ErBI30o2zt6d9o6ugez46lgMDhzWlkb9Ujgv
	 dEwnRwxpVj7KhfFVjo3oJ1TzR5R9THrYGyzu82uBBkB4aP2o3T4LEyIUJLueAmk9asA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D12Tfgse;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034160A2617
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D12Tfgse
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0FB1F000C4;
	Thu, 19 Nov 2026 06:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070700;
	bh=Ct3xVuraqIgSvW2uZojlh2VFdfDZrsrHXmqMp73nLbI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D12Tfgseor3kfWoVbPqOfVGVyed19jw4pKSxhj4IYYzddko2ksIXtTC1aEKIYmLJ9
	 4oEl6N9/gWNkJb339k0J3abPli6eg74hAFnUXpKKYAffFjSJXkoAQiVlBs6+SkYGw5
	 IglbS4OezZqnocMBuqISuURAOeSntaTfOHSo3JIvGQ/CJ/VedBrSD1kIWVTdzqV4OL
	 FpzImUULfIhGWma+kejKF387C0GvYiWnLiyBlN+MXQ4+3CGF3nXyiVZspEspZ/mTJJ
	 hxT9347NKyu82F53zfg6seCtAY7y/LBiNP8OrXxcFfPcPYA0xtW7DuPUaw+qcH+9lL
	 1D7ASBe4Tz6yA==
Subject: Re: [net-next v6 09/15] iavf: increase max number of queues to 256
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, aleksandr.loktionov@intel.com,
 andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, corbet@lwn.net, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, jacob.e.keller@intel.com,
 jedrzej.jagielski@intel.com, jiri@resnulli.us, leon@kernel.org,
 mbloch@nvidia.com, mschmidt@redhat.com, ohartoov@nvidia.com,
 pabeni@redhat.com, poros@redhat.com, rdunlap@infradead.org, saeedm@nvidia.com,
 skhan@linuxfoundation.org, tariqt@nvidia.com
Date: Thu, 19 Nov 2026 06:44:58 +0000
Message-ID: <179507069863.3136.4636322783372070178@kernel.org>
In-Reply-To: <20261117094913.100756-10-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-10-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch turns q_vector->ring_mask into a fixed 256-bit
  bitmap (DECLARE_BITMAP(ring_mask, IAVF_MAX_REQ_QUEUES)).
- [Low] The new helper iavf_itrn_reg() (iavf_main.c:423) picks the ITR
  register bank per vector index: IAVF_VFINT_ITRN1 (base 0x2800, 0x40…

--

iavf: increase max number of queues to 256

This patch raises the iavf queue limit from 16 to 256. It turns
q_vector->ring_mask into a 256-bit bitmap and allocates the netdev with
256 Tx/Rx queues. Queue vectors are capped at 64, and the ITR of vectors
16..63 is programmed through a new IAVF_VFINT_ITRN_64 register bank.

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
> index 822d6e692d495..db769eead68f3 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_main.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
> @@ -419,6 +419,15 @@ static irqreturn_t iavf_msix_clean_rings(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +/* VFINT_ITRN1 fits 16 vectors only, VFINT_ITRN_64 aliases it for up to 64 */
> +static u32 iavf_itrn_reg(enum iavf_dyn_idx_t itr_idx, u16 reg_idx)
> +{
> +	if (reg_idx < 16)
> +		return IAVF_VFINT_ITRN1(itr_idx, reg_idx);
> +
> +	return IAVF_VFINT_ITRN_64(itr_idx, reg_idx);
> +}

[Severity: Low]
Is the aliasing in this comment documented anywhere? When a VF has more
than 16 queue vectors, iavf_itrn_reg() programs vectors 0..15 through
the 0x2800 bank and vectors 16..63 through the 0x2C00 bank.

idpf_lan_vf_regs.h describes the same VF register space. There, the two
banks are alternatives chosen by the VF's vector mode:

/* For VF with 16 vector support, itrn_reg_spacing is 0x4, itrn_indx_spacing
 * is 0x40 and base register offset is 0x00002800
 */
...
/* For VF with 64 vector support, itrn_reg_spacing is 0x4, itrn_indx_spacing
 * is 0x100 and base register offset is 0x00002C00
 */

Suppose a VF in 64-vector mode does not decode the 0x2800 bank. Then the
first ITR writes for vectors 0..15 in iavf_map_vector_to_rxq() and
iavf_map_vector_to_txq() are lost. Both functions still set current_itr
to target_itr afterwards.

With static ITR (adaptive turned off with ethtool -C),
iavf_update_enable_itr() only rewrites ITR when target_itr !=
current_itr. Would those vectors then stay at the hardware reset
moderation value?

Using IAVF_VFINT_ITRN_64 for every vector whenever the VF has more than
16 vectors would not depend on the aliasing. Would that be safer?

> +
>  /**
>   * iavf_map_vector_to_rxq - associate irqs with rx queues
>   * @adapter: board private structure
> @@ -439,8 +448,8 @@ iavf_map_vector_to_rxq(struct iavf_adapter *adapter, int v_idx, int r_idx)
>  	q_vector->rx.count++;
>  	q_vector->rx.next_update = jiffies + 1;
>  	q_vector->rx.target_itr = ITR_TO_REG(rx_ring->itr_setting);
> -	q_vector->ring_mask |= BIT(r_idx);
> -	wr32(hw, IAVF_VFINT_ITRN1(IAVF_RX_ITR, q_vector->reg_idx),
> +	set_bit(r_idx, q_vector->ring_mask);

[Severity: Medium]
Can r_idx reach 256 here? ring_mask is now
DECLARE_BITMAP(ring_mask, IAVF_MAX_REQ_QUEUES). iavf_map_rings_to_vectors()
calls this for every ridx up to num_active_queues - 1, and nothing checks
r_idx against IAVF_MAX_REQ_QUEUES.

The only clamp is in iavf_validate_num_queues(). It checks only
vf_res->num_queue_pairs, and it rewrites vsi_res[i].num_queue_pairs only
inside that branch:

	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES) {
		...
		for (i = 0; i < adapter->vf_res->num_vsis; i++) {
			vsi_res = &adapter->vf_res->vsi_res[i];
			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
		}
	}

The queue count, however, comes from vsi_res->num_queue_pairs (a u16).
In iavf_alloc_queues():

		num_active_queues = min_t(int,
					  adapter->vsi_res->num_queue_pairs,
					  (int)(num_online_cpus()));

and in iavf_set_channels():

	if (num_req == 0 || num_req > adapter->vsi_res->num_queue_pairs)
		return -EINVAL;

Take a PF that reports vf_res->num_queue_pairs <= 256 but
vsi_res->num_queue_pairs > 256. num_active_queues can then go above 256,
either on a guest with more than 256 vCPUs or after
"ethtool -L combined N" once the PF grants N.

If so, set_bit() writes past ring_mask. Small overruns hit the q_vector
fields that follow it (itr_countdown, num_ringpairs, v_idx, reg_idx,
name). Larger r_idx values land past the end of the q_vectors array.
Before this patch, the same input only reached "|= BIT(r_idx)" on a
u32. That shift is undefined, but it stays inside the field.

The in-tree ice PF reports the same value for both counts. Hitting this
needs a buggy or malicious PF, which is the case the driver's own
comment in iavf_validate_num_queues() is meant to guard against.

The final iavf_validate_num_queues() at the end of the series has the
same structure; only the threshold depends on LARGE_NUM_QPAIRS_SUPPORT.

Should iavf_validate_num_queues() clamp vsi_res[i].num_queue_pairs on
its own terms? Or should r_idx be bounded before the set_bit()?

>  	     q_vector->rx.current_itr >> 1);
>  	q_vector->rx.current_itr = q_vector->rx.target_itr;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
