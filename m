Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879365;
	b=CxcwFjrfRnNbjZHuC7i9KHWX7hb2yDIzJW9fQ/gbiSq74Q1WJILn5K+6hvnzGBQCyY6n
	 QWFndDm3iGi5v/64BoP3LSaFm4FbRw8eASc/7v2IcJWGROhI8KldGTSWPEcCxGlFt2QF0
	 j0c2lAMnSyKCxKM4Yb6YJwEesRBuyRjSyL3Ih0QqeGM2GebK5EexcmaVkceobS4AR9euU
	 tEegSY35m/8F/WHBcVKGUAtJBtLfoKdyF/UZ17xGpYeyi6NFOy2If/0XJASA1S4o7oq0i
	 I9ekp+2nYTQIWWiIhiHsy6WWlp32zlX2oHuQa/Qjw8S/iM74iu232BOBkioVFMUdjNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879365;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0oa3j07kXyZQBIJLMtKm5SECI56azgs/G/G1UrHj1IA=;
	b=1BJhDYKmiBBxFDT65he/P4CxDxf8LCJyerLmjlyfPjgzbrRAJOX89E1VQiHVv6s4aXZ5
	 3oxejShAfhiIfoOzvz32/iEHH1LVLji8OjJEyV68AwZI1B5TBBoXqDw/+QARH1IrbrmvB
	 h1hU3CpjxEL51CqKKtm7a6J2vNTmAY8YWDSSep0EW0aCEvIqLIcOUiUPndmItiefxGu/K
	 5V54SpP5GNOO/wsinsJbUX7CDTqBalPFanjH/mKsyz1nUQLxU7rwW9ktQ+p1JC23wxQVW
	 NnvDngJAHVFcv1IsUPp854DcuJVfRFUV0Ma66vyziFji7QxRjgFXS56mDpvva6RX/Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiL4JS0s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5AF606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiL4JS0s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4C01F000C4;
	Tue, 17 Nov 2026 01:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879365;
	bh=0oa3j07kXyZQBIJLMtKm5SECI56azgs/G/G1UrHj1IA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KiL4JS0scrKK+wGeik35n5dAoLFQSgcny2+6x8x3jQMBZdTaJP2s5yJ+cBJqGx41J
	 VEBMdUe0h0e3S9tjH7Ql/M0Km9wMIwsIoCqAiGrm0VzQ24xI4L2seOoxfRoOsC5kN9
	 6s103OoQvChC4gnfEhdS83KvwhL67m+LRdsic8B/Zhr4MOq6/uwoglU9FHGrL2W/IR
	 NcnAU7t86GB+tQRdWjlxSg4133b6L1oSQhEvQ0+Cnm14Bkj4neTfLyAImLPBXn3V3i
	 UjoBp3tuPiIs2YbH1frARM2UmfdZe+EoT3k1bJ4tZpHYAKtkUk1sUR6BYR/HRHbkbk
	 yVqPvSn/s37nw==
Date: Mon, 16 Nov 2026 17:36:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, haren@linux.ibm.com,
 ricklind@linux.ibm.com, davemarq@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Subject: Re: [PATCH net-next v8 08/15] ibmveth: Add queue-aware RX buffer
 submit helper for MQ
Message-ID: <20261116173604.50e83f10@kernel.org>
In-Reply-To: <20261109235556.60604-9-mmc@linux.ibm.com>
References: <20261109235556.60604-1-mmc@linux.ibm.com>
	<20261109235556.60604-9-mmc@linux.ibm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 15:55:49 -0800 Mingming Cao wrote:
> This patch queue-indexes RX replenish and pool access ahead of MQ
> enable:
> 
>   - hcall: ibmveth_add_logical_lan_buffers() (MQ queue hcall vs legacy)
>   - concurrency: per-queue replenish_lock; replenish outcomes logged
>     after unlock
>   - poll/pool: rxq_* take queue_index; INVALID_MAP and correlator
>     errors refactored
>   - limits: IBMVETH_MAX_RX_PER_HCALL 12, IBMVETH_MAX_RX_REGULAR 8
> 
> Runtime stays single-queue until the MQ enable patch; correlator,
> lock and replenish return paths apply on queue 0 immediately.
> 
> Replenish is the last open-path hypercall that still assumes queue 0.
> Registration is already queue-aware, and multi-queue posts buffers
> through H_ADD_LOGICAL_LAN_BUFFERS_QUEUE against adapter->queue_handle[],
> but ibmveth_replenish_buffer_pool() still calls
> h_add_logical_lan_buffer() or h_add_logical_lan_buffers() directly.
> 
> Add ibmveth_add_logical_lan_buffers() to route RX buffer pool
> replenishment through H_ADD_LOGICAL_LAN_BUFFERS_QUEUE in multi-queue
> mode, falling back to the legacy 8-buffer and single-buffer hypercalls
> in single-queue mode.
> 
> Supporting that helper means the RX side can no longer assume queue 0.
> The queue index is 0 everywhere until multi-queue RX is enabled, so
> the queue plumbing below does not change behaviour yet. The correlator
> and locking changes do take effect immediately, on the single queue.
> 
> Parameterise the RX accessors by queue. The eight ibmveth_rxq_*
> helpers took only the adapter and hardcoded rx_queue[0]; they now take
> a queue_index, as do ibmveth_remove_buffer_from_pool() and
> ibmveth_rxq_get_buffer(). ibmveth_rxq_correlator() becomes
> ibmveth_rxq_read_correlator(); poll still reads the correlator once
> per slot, as net-next does, and now passes the queue index with it
> to rxq_get_buffer() and rxq_harvest_buffer().
> 
> Add a per-queue replenish_lock to struct ibmveth_rx_q, initialised in
> probe. Replenish is not the only writer of a pool's free_map: the
> harvest and remove consumer runs from that queue's NAPI instance. At
> this commit replenish also runs only from NAPI (netpoll's budget-0
> poll skips it), but later patches (MQ open and the queue resize)
> replenish from process context while that queue's NAPI may run, so
> producer and consumer can run at once. Its users are NAPI and process
> context, so it is taken with spin_lock_bh().
> 
> Give ibmveth_replenish_buffer_pool() a return value. It was void and
> logged from inside what is now a critical section. It now returns one
> of IBMVETH_REPLENISH_OK, _RESET_MAP, _RESET_MQ, _HCALL_FAIL or
> _BATCH_FALLBACK, and ibmveth_replenish_task() does the logging and any
> schedule_work() after dropping replenish_lock. Replenish map paths use
> DMA_ATTR_NO_WARN; failures are counted, and the next poll's replenish
> retries. As before this patch, a queue whose pools are left with
> nothing posted gets no further poll and waits for a reopen. The
> hcall-failure warning now logs against the netdev rather than the vio
> device, the two batch-fallback info messages become one ratelimited
> warning, and DMA_ATTR_NO_WARN silences the DMA layer's map-failure
> warning. In multi-queue mode an H_FUNCTION from the buffer-add hcall
> schedules a reset instead of the legacy single-buffer fallback;
> that arm is unreachable until MQ RX is enabled.
> 
> An IBM_VETH_INVALID_MAP free_map entry no longer WARNs. It now drops
> the partly filled batch (those skbs stay in the pool for reuse),
> skips the remaining pools and schedules a reset, where the old code
> posted the partial batch and moved on to the next pool.
> replenish_task() also returns early for a queue index at or past the
> live count, and ibmveth_poll() logs an IRQ enable failure before it
> schedules the reset.
> 
> Update replenish_task_cycles under replenish_lock; the statistics patch
> moves that counter per queue.
> 
> Snapshot the first BATCH_FALLBACK and HCALL_FAIL into their own
> copies and log those after unlock, so a later pool cannot overwrite
> the values those two messages print.
> 
> Make the correlator check per queue. ibmveth_rxq_correlator_valid()
> takes the queue index and also requires the pool to be active with a
> free_map. It no longer logs or schedules the reset, because
> remove_buffer_from_pool() now calls it under replenish_lock:
> ibmveth_rxq_bad_correlator() and ibmveth_rxq_no_skb() do the
> ratelimited log and the reset, called by rxq_harvest_buffer() after
> remove_buffer_from_pool() returns and by rxq_get_buffer() directly.
> The ring still advances on every error. The KUnit tests pass the queue
> index and set up free_map and replenish_lock.
> 
> Redefine IBMVETH_MAX_RX_PER_HCALL from 8 to 12, the argument-list
> capacity of H_ADD_LOGICAL_LAN_BUFFERS_QUEUE, and add
> IBMVETH_MAX_RX_REGULAR (8) for the legacy hypercall. Probe sets
> rx_buffers_per_hcall to IBMVETH_MAX_RX_REGULAR, so the legacy batch
> stays at 8 until multi-queue RX is enabled.
> 
> free_buffer_pool() keeps probe/sysfs geometry (active/size/threshold)
> and zeroes pool->available so teardown cannot leave a stale count.

The further you get in the series the sloppier the commits.
Please trim this text, tell your LLM we can read the code :/
