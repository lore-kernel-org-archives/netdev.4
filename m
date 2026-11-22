Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336427;
	b=AaE+e+s5pnHc07fpa1egP7whBds8gWBJ2r3sxzt3JPagJCDzCj2q3sj0qZIElusyCu9X
	 +VIkQHGMiuals5gW2Lm32EvB+GyjpWEC2vfUyNWtDCsH70LJ6cS+ZxK5KUBtqDdL6faQd
	 91OaX1/O0HkSOTYyKZssyZEsg3GshTTztyS1SRaqVLtypdIBib64QmdCL2NXFW42KDnWi
	 WUXwHg4fkEn2a0HTK5f4gFzbOO0KodPOQG12T1vzSx4uASf7BL5/+kLMnYoMvx6oBQskO
	 PQ3ovuvVNnYXUPYDhLFHBPDd1KCpL11HfDmjTF9vekYbqnhLvWlLAvfhtStLiopm3uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336427;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4B5xglvQmDMhBxbJuTEK9yBt10idEDUaQreE0rT6bZ8=;
	b=sd6j1ZHrnrofo45/AXNCdKPXi5TyOKufWBqErgHXHLxTmVt+Sku7Ak9ZnEdWKH5OT3wY
	 8tvjheq+YM2eXbtBqr/7JsXzab4RdkG04flaFGqCsxmGz6wbqckjrSENPtPdVi5N1HYjr
	 4DmtUHQKDlmIE3CjxHYOe3t/kpyb95loWDXk8M6jBQ/G7G+eZ0MJyKmnkLn/aD8tKQBk+
	 /16z42WorpG2E0IRvR1B0J7yczxPVOVSo8DUYJP/p9CcFzxbwb2+T54AQOHwZFb2AbEW2
	 XEIQ+6Ej1DwKYlvhPe1gm5B2SyOBKNsNDMeBlNd0lp4Ovbe8rCQkRGUXTf+p5Ohvr3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXNQXGse;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3687C606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXNQXGse
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1341F000C0;
	Sun, 22 Nov 2026 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795336427;
	bh=4B5xglvQmDMhBxbJuTEK9yBt10idEDUaQreE0rT6bZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BXNQXGse0YqWdAeFQXiyYZ0W25gWqlyvrm4/12bemPjSAQ8SyBRjK1n1ti8007x3D
	 b3WyV0M28eCucifIkbgO/H3R9cTzhx/biDeiqt56aXZLfEnpd7BoYVT/E0Nkp3ZJgL
	 53MH1QUxphfcDOh+my4e1mjs9XV92C4JDOMzTYFBQW2YbdcLmQLqHYKORGvebi9/2X
	 UOocyZaGhvV/1WPBbY6KNOJFZTebm0mlKYvPSA6MDMOOgWrEYzt8jgOwn4k+dRdXJL
	 9N6LG28Rxh92YevQTtsfvizz8c6KPgQ/OHdJ0eDI8d2Yrvvb1tfU6VXPvqgdzkyuxc
	 Kx5KJCnuEsk7w==
Subject: Re: [PATCH net v8 1/2] net: wangxun: protect ring accesses with RCU
From: netdev-bot+sashiko@kernel.org
To: mengyuanlou@net-swift.com
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, hramamurthy@google.com,
 jacob.e.keller@intel.com, przemyslaw.kitszel@intel.com
Date: Sun, 22 Nov 2026 08:33:45 +0000
Message-ID: <179533642599.3135.8576432289828139956@kernel.org>
In-Reply-To: <20261118081329.39551-2-mengyuanlou@net-swift.com>
References: <20261118081329.39551-2-mengyuanlou@net-swift.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The commit message describes VF suspend/resume changes that are
  not in the patch, and relies on them to argue that the new __rcu /…

--

net: wangxun: protect ring accesses with RCU

This commit marks wx->tx_ring[] and wx->rx_ring[] as __rcu. Readers are
converted to rcu_dereference() or rtnl_dereference(). The reg_idx
computation moves into per-ring allocation via wx_get_reg_idx(), and
wx_xmit_frame() gains checks for a NULL ring or zero queue count during
teardown.

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

[Severity: High]

Is a VF hunk missing from this patch, or does this paragraph describe a
different revision?

The only change to wx_vf_common.c here is the rtnl_dereference()
conversion in wx_configure_rx_vf(). wxvf_reopen_subtask() does not exist
anywhere under drivers/net/ethernet/wangxun/. After this patch,
wxvf_suspend() (which wxvf_shutdown() also calls) and wxvf_resume() still
read:

drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:wxvf_suspend() {
    netif_device_detach(wx->netdev);
    wx_clear_interrupt_scheme(wx);
    pci_disable_device(pdev);
}

drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:wxvf_resume() {
    pci_set_master(pdev);
    wx_init_interrupt_scheme(wx);
    netif_device_attach(wx->netdev);
}

So wxvf_suspend() takes no RTNL and does not call wxvf_close() on a
running interface. It also does not set WX_STATE_DOWN and does not cancel
service_timer or service_task.

The new comment in struct wx says:

    Control-path readers use rtnl_dereference() while holding RTNL.

That only works if the writers in wx_free_q_vector() also hold RTNL. On
this path, wx_free_q_vectors() zeroes the queue counts, NULLs each slot,
and calls kfree_rcu() on the q_vector that embeds the rings, all without
RTNL.

Can the service task race with this? Suspend leaves the timer armed and
WX_STATE_DOWN clear, so the check in wxvf_reset_subtask() still passes:

wxvf_service_task()
  wxvf_reset_subtask()
    rtnl_lock()
    wxvf_reinit_locked()
      wxvf_down()
        wx_clean_all_tx_rings()
        wx_clean_all_rx_rings()
      wx_configure_vf()
        wx_configure_tx_vf()
        wx_configure_rx_vf()

wx_set_ringparam_vf() is another example:

    rtnl_dereference(wx->tx_ring[i])->count = new_tx_count;

None of these readers check for NULL or run inside an RCU read-side
section, and some of them sleep, e.g. read_poll_timeout(). Could they
dereference a NULL ring, or use a ring after its kfree_rcu() grace period
has ended?

On resume, wx_init_interrupt_scheme() publishes new zeroed rings with
tx_buffer_info == NULL and desc == NULL, and sets WX_STATE_DOWN. Nothing
reopens the device after that. netif_device_attach() then wakes the TX
queues of a netdev that is still running, and its carrier was never
turned off.

The new checks in wx_xmit_frame() pass, because num_tx_queues is non-zero
and the ring is non-NULL. Does wx_xmit_frame_ring() then dereference a
NULL tx_buffer_info here?

    first = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
    first->skb = skb;

Because suspend skips wxvf_close(), the queue and misc IRQs are not freed
before pci_free_irq_vectors(). NAPI instances that are still enabled are
passed to netif_napi_del(). The descriptor DMA memory, the buffer_info
arrays and the page_pool are reachable only through the rings freed by
kfree_rcu(). Do these leak on every suspend or shutdown with the
interface up?

Much of this VF lifecycle behaviour predates the patch. However, the
commit message depends on the RTNL, close, drain and reopen changes to
justify the rtnl_dereference() locking model, and those changes are not
in the patch. Could the missing VF changes be included, or could the
commit message and the struct wx comment be corrected to match the
locking the code actually has?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118081329.39551-1-mengyuanlou%40net-swift.com
