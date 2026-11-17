Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959671;
	b=aJDjZN1L59ji6+OK2asRvWeK+TrDOousNDHpTaJMnqVjXOvBp7dAXzZH5+WCZpMNlbT+
	 0HkaPIebJXjV3y7MJxPNmHFxA+OW9Ac+SRAVSqPFQ9eT1uKShTr8axqY4vNCNTYfbnZqF
	 4JnYgqfHJhcryXKGHynJADA1xnxTh3nuL3aZ0ER6S9bvxlgP+aAbqTWN1D9gpCyqvtVrA
	 PESG58yQyyDakVJ05mmFNtJVA5HJqdBXj2HGVSTexDLoPvI/UOCNaHMhk6+EVdLF871Oz
	 MMtJTlyjDrcJP+WdIKZwqP17HC6GddatO3Mvx/MMjY/MgkCCMW9P7nfBUvDcyZ/REPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959671;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wpDRR1FQHLWCIIyRrBTpW/F77jX1ML335hD9IxtIJmc=;
	b=tDla2t579ffNYEmkanGkTMdNrYGOOeZ12DUIvkO7YHFJl27shyk3D4K4uzlRoHYGsSSB
	 +M83FcT3CkaWRPF/RGghGChluRyAR2cvr2/8MWTD6wU5UYPEMhQOAgagM/trwlBhAmHWQ
	 zxMwC331AaTEc0ha4QsRucGBT+22Y1PR80wgwzpyOoaTwIOvyzTBRvTiwW6wGzigoRucq
	 XGAm841edBfswC25jsJStKfmVcknQCZHHFeD/7Z6qijMjFtpwTg2BD2q2LpxjdkH1pfty
	 7qvTU2rZorqYf3GN8wnDThDMf3BMwHLmeAQ4JKciB0EG4669s9T7eOojTSZfnfhbtkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kBvKF7f0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909EF606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kBvKF7f0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB0A1F000C4;
	Tue, 17 Nov 2026 23:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959671;
	bh=wpDRR1FQHLWCIIyRrBTpW/F77jX1ML335hD9IxtIJmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kBvKF7f0bvxwejGZCgPmUsPJWEU+knypyFP9B9GAKW30gZ8T7QROh8MfDQAKdNohI
	 9zocUb6hNBPjhxA+P7CWjbG+Z1+gJYaQ4MspTmgKsy5pngrDRTwK/ovQt1l/dz0t/x
	 hARKgRroSra+Av+VIPm43mYEnmSkBRCq4rtIFRvxIRaIL2TWDH9Wx5H0jkd5pfKhqI
	 w1BeQaTcFFCg4W6WAMHg7M61zPawXl+AMv/0t1E6Q8hxrUKnU+8+5kRPEvcrZs5SRL
	 Eh9uskxHmUW0WbqvEud7Z9U+XO/UvgNgL8e0WvqegQw8dVAGXhPu2vxUsXSZZjD/jq
	 pvK1HMzMIKLMw==
Subject:
 Re: [PATCH net 1/6] ice: use global queue index in TC to-queue offload
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, poros@redhat.com,
 david.m.ertman@intel.com, pengpeng@iscas.ac.cn, przemyslaw.kitszel@intel.com,
 vinicius.gomes@intel.com, sridhar.samudrala@intel.com,
 aleksandr.loktionov@intel.com, horms@kernel.org, alexander.nowlin@intel.com
Date: Tue, 17 Nov 2026 23:54:29 +0000
Message-ID: <179495966975.3136.12081407702271648578@kernel.org>
In-Reply-To: <20261113231225.1864810-2-anthony.l.nguyen@intel.com>
References: <20261113231225.1864810-2-anthony.l.nguyen@intel.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In commit "ice: use global queue index in TC to-queue offload",
  the PF-to-global queue conversion is done only where the value is…

--

ice: use global queue index in TC to-queue offload

The patch changes the queue ID programmed for TC flower to-queue rules
from the PF-relative index to the global index. It does this by adding
hw->func_caps.common_cap.rxq_first_id in ice_add_tc_flower_adv_fltr().
Before this, rules failed on every PF except PF0.

> diff --git a/drivers/net/ethernet/intel/ice/ice_tc_lib.c b/drivers/net/ethernet/intel/ice/ice_tc_lib.c
> index d20357c041273..6f49ecb4165b2 100644
> --- a/drivers/net/ethernet/intel/ice/ice_tc_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_tc_lib.c
> @@ -1202,7 +1202,8 @@ ice_add_tc_flower_adv_fltr(struct ice_vsi *vsi,
>  		break;
>  	case ICE_FWD_TO_Q:
>  		/* HW queue number in global space */
> -		rule_info.sw_act.fwd_id.q_id = tc_fltr->action.fwd.q.hw_queue;
> +		rule_info.sw_act.fwd_id.q_id = tc_fltr->action.fwd.q.hw_queue +
> +			hw->func_caps.common_cap.rxq_first_id;

[Severity: Low]
After this change, tc_fltr->action.fwd.q.hw_queue still holds a
PF-relative value. Is the comment on that field in struct
ice_tc_flower_action still accurate?

drivers/net/ethernet/intel/ice/ice_tc_lib.h:
	u16 queue; /* forward to queue */
	/* To add filter in HW, absolute queue number in global
	 * space of queues (between 0...N) is needed
	 */
	u16 hw_queue;

ice_tc_forward_to_queue() still sets it from the PF-relative rxq_map,
which indexes pf->avail_rxqs:

	fltr->action.fwd.q.hw_queue = vsi->rxq_map[queue];

Both dev_dbg() calls in ice_add_tc_flower_adv_fltr() that print
"(HW queue %u)" still print tc_fltr->action.fwd.q.hw_queue:

	dev_dbg(dev, "add switch rule action to forward to queue:%u (HW queue %u), lkups_cnt:%u\n",
		tc_fltr->action.fwd.q.queue,
		tc_fltr->action.fwd.q.hw_queue, lkups_cnt);

	dev_dbg(dev, "added switch rule (lkups_cnt %u, flags 0x%x), action is forward to queue: %u (HW queue %u)     , rid %u, rule_id %u\n",
		lkups_cnt, flags, tc_fltr->action.fwd.q.queue,
		tc_fltr->action.fwd.q.hw_queue, rule_added.rid,
		rule_added.rule_id);

On any PF where rxq_first_id is non-zero, these messages now show a
different queue from the one written into fwd_id.q_id.

Would it make sense to add rxq_first_id where hw_queue is assigned in
ice_tc_forward_to_queue()? That would keep the stored value, the
comment and the debug output matching what is programmed. The other
option is to update the comment and the log labels to say the value is
PF-relative.

>  		rule_info.sw_act.vsi_handle = dest_vsi->idx;
>  		rule_info.priority = ICE_SWITCH_FLTR_PRIO_QUEUE;
>  		rule_info.sw_act.src = hw->pf_id;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113231225.1864810-1-anthony.l.nguyen%40intel.com
