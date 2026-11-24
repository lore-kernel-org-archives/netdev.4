Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519416;
	b=mVG+XHydMqrHYmQNRAzikKX1NxfxjI3vGEQr3aOncJ8gPiGsKJiCa8m0K/KsK56Y1K7d
	 wNiXyLa8pau8Q3lum2rL4wS0PT1VX5mesUXou7fRrDF56hZjnlCK8LAzZ7YmP6SGHbt5g
	 9FpSvrARgRPFFv1bYR2YEoDWKI6JbQ+7nyYOEYr8JtynxWg58BviYaYAy8jfE5gQsq9Se
	 T7HN1vWsohrScd1zcdF6veqyTUX2hHAf/ijtx/TQEfYNDphOzUMSlPvgfALtr+2CzUWHW
	 fbWoDOmiWZGF0FGFlk/ZE21o0vjYRVw9D3XEHvH2D3iD9XLG0jyFuI+1EblSA3H4iww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519416;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DgIESJx/OzNSi+XE4Kpwkpt4Xh11qzjNFJ3vOR9mBNE=;
	b=hGmYq5byaisxT2gGgATiwJWPIqLvcutAhkNdeXvVdwdBAq25TPH40Is7XrQ2aYM3jQSK
	 VzEin5W1Vb84AfBawpD+yxUdsCODyScGdVzuUTkP0bt1bhzLa5qTNO38yIsyOqCXw7JJA
	 Nd6RjFCt2hKLLl52mvTe/W5KzabUyCj5RwVGTKpEIylK4vhWDSoHn/feXKuRhFOGz71Ry
	 E2Sfm8Y0rCKTCw8wuLbtmdg1jFdfX3q68WGD+6z/PpmwTfFAVqc0C31dHrcLd6d0g85lV
	 syxzc2kdqDBuS1kU5iAVCOax4HhewtSUokyFezBl81HZEcyhTqXbgGY8+PQAINntcjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Baw1Jfta;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D48606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Baw1Jfta
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CB41F000C4;
	Tue, 24 Nov 2026 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519415;
	bh=DgIESJx/OzNSi+XE4Kpwkpt4Xh11qzjNFJ3vOR9mBNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Baw1Jftaikr/WrOzMwe/s65Q1RJJZPRnm0ndgukey6IUwYscpgglnrDkHYy3cYXBX
	 CNp6pZqvuvgyIvpzfcPenetFWWF/MEK376SnDKGOW6s91lyn2taaeKSkDbZbBFMpDJ
	 A6/oKA1uF/PfDg6ZHQ3Jkb6njcRjxpuIH41gu6J7EHjwEGcd6f2uBjIfiIp9pB43xI
	 fg1XSrRC0cjBEThzMXhHZt0F8wdOpRRhm2bAbyqb0wYBJpQeWmNskeWRFlyiutPa0t
	 f1uFR7u1PG6mu7Hps2ElG8FPQRuO4tneQba80zdKzoz3XxUqmhu7O24TjiQF8bJciu
	 s5s0KkTnBx4BQ==
Date: Tue, 24 Nov 2026 11:23:30 +0000
From: Simon Horman <horms@kernel.org>
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
	duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hramamurthy@google.com,
	jacob.e.keller@intel.com, przemyslaw.kitszel@intel.com
Subject: Re: [PATCH net v8 1/2] net: wangxun: protect ring accesses with RCU
Message-ID: <20261124112330.GI31322@horms.kernel.org>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <20261118081329.39551-2-mengyuanlou@net-swift.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118081329.39551-2-mengyuanlou@net-swift.com>

On Wed, Nov 18, 2026 at 04:13:28PM +0800, Mengyuan Lou wrote:
> In the Wangxun driver family, ring pointers in wx->rx_ring[] and
> wx->tx_ring[] can be published, cleared, or replaced during interrupt
> scheme teardown, channel reconfiguration (e.g. via ethtool -L), or TC
> setup.
> 
> Various lockless readers, including stats gathering, PTP watchdogs,
> and flow control checks, access per-queue ring structures without
> formal RCU annotations. Although q_vector memory lifetime is managed
> via kfree_rcu(), the ring array accesses themselves lack explicit RCU
> dereference semantics and barriers.
> 
> Annotate the ring arrays and convert their readers and writers to RCU
> primitives. Move the queue-to-register index calculation from the
> post-allocation wx_cache_ring_rss()/wx_cache_ring_vmdq() pass into per-ring
> allocation via wx_get_reg_idx(). Initialize each ring's reg_idx before
> publishing its pointer so lockless readers cannot observe an uninitialized
> value.
> Use rtnl_dereference() in control paths protected by RTNL, and RCU
> read-side critical sections for lockless readers.
> 
> The ring arrays are managed by wx_alloc_q_vector() and
> wx_free_q_vector(), reached through wx_init_interrupt_scheme() and
> wx_clear_interrupt_scheme(). The probe paths call
> wx_init_interrupt_scheme() before the netdev is registered; the
> allocation path only publishes rings with rcu_assign_pointer(), so no
> RTNL is needed there. wxvf_resume() defers rebuilding the interrupt
> scheme to wxvf_reopen_subtask(), which runs under RTNL. wxvf_suspend()
> holds RTNL across wxvf_close() and wx_clear_interrupt_scheme(),
> protecting control-path readers and serializing teardown against the
> reset subtask. The service timer and work are drained before the PCI
> device is disabled.
> 
> ngbe_dev_shutdown() keeps RTNL held across the WoL setup as well.
> That matches the locking of the other wx_configure_rx() callers and
> keeps the WoL configuration from racing with a channel reconfiguration,
> which re-creates the interrupt scheme. wx_clear_interrupt_scheme() has
> already zeroed the queue counts before wx_configure_rx() runs, so its
> ring loops do not access the ring arrays on this shutdown path.
> 
> wx_xmit_frame() also needs to handle teardown racing with transmission:
> wx_free_q_vectors() can zero wx->num_tx_queues while the netdev remains
> registered, which could otherwise cause a modulo-by-zero, and the ring
> slot can be NULL. Bail out on either condition and account the dropped
> skb. Also account for the carrier-off path and skb_put_padto() failure;
> the latter frees the skb on error, so only the counter can be updated on
> that path.
> 
> Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
> Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>

Reviewed-by: Simon Horman <horms@kernel.org>

