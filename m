Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414980;
	b=pmmMk3VS1Z36UsSkU1TDLct7c1+BZBg/+UIyEFCxKUjzPtQTAxcpOeSEPjU7FBsqShu7
	 YRdw68r6yTvDxBHavKC3fbyQe4MPgrsRrAVhdsqrd/avLJYC2DvdHHbRdm9oyZoH7UF6p
	 xIpMIs0lfEt7tKNInTdbJyhOfx1cdP6QWpelGyTWlE8N+XZTOK2MQXve/99LHn8JjRXfo
	 11q9Qg/TdcR//VD9H5D7gdV5nhZheXPT1V6CtaLHOJ31zU4EGZchZJYvaR2T0XPUBdSfR
	 yDGZqF2Jrw4kA20SLil9NDv1Rza51w2bVRZKGjR1Jz6R4havEhkq6Nz+yRVkYddyhlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414980;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=E0SzxQNyO/uz2Vmt2xfShNpjdQxODRf21ORNBL7OCDI=;
	b=bLD9cunZBuhXBzZxEjzNWHHmYdkyInVdkJEXU504i5N191POM6+1HjojZBVicWcTgC90
	 85EbpX3IuiWGu9zDKlMga7WFV8KkqzSa1yW7YrEgG/GNCN2nATvWQV1/vqtYO/pq4uWOG
	 5BczAfQqSaEUeUrdpPUfVjAIQG6zjt0tsEyusra7V9hNJ94gAh11N/+iZw5Wys0aAzMxq
	 YhSlQQnYwB9OP3G1o9cX1mVbvOjGxNXZeAplAEKjD1F04LxuotXgDmyBS6r0t7rF8pCCp
	 LnmLLVpC8nuHM8eGQUsxKwT0Vxz12fO8g7NhBuzE01jWu3egdh2Rk/K+I2rjjwnQr4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51F2606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: zesmtpgz7t1795414880t94da28dd
X-QQ-Originating-IP: HeS6DOpmqT5ZUuVCSAEEzeF9BBtJUj8cUbGrAqp0wFE=
Received: from smtpclient.apple ( [36.24.187.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 14:21:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4641797366784374674
EX-QQ-RecipientCnt: 13
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH net v8 1/2] net: wangxun: protect ring accesses with RCU
From: "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>
In-Reply-To: <179533642599.3135.8576432289828139956@kernel.org>
Date: Mon, 23 Nov 2026 14:21:07 +0800
Cc: netdev@vger.kernel.org,
 jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com,
 linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch,
 davem@davemloft.net,
 edumazet@google.com,
 kuba@kernel.org,
 pabeni@redhat.com,
 hramamurthy@google.com,
 jacob.e.keller@intel.com,
 przemyslaw.kitszel@intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD0ED59F-3879-46FE-AA7C-E97C81CA57EC@net-swift.com>
References: <20261118081329.39551-2-mengyuanlou@net-swift.com>
 <179533642599.3135.8576432289828139956@kernel.org>
To: netdev-bot+sashiko@kernel.org
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:net-swift.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OCRLgRRf+JROd/VXA4fWPwR1kTP/5jzrJYYGzoq97XF3oAGZqaStSyuJ
	0jHFJYQXsyVNO/Weh54k+/DnZL9IKa/LboeRbXBM0wyHbaxw5k7Uh4GHPtJZmbx94FuekF4
	sTfAAnSRp36cGIn+wxDHZcgDttI9iiHX161cofh9w5ZgwelZOC6iYowJkEqepSkWf3Th9Hg
	Md8eAxYQpCO2pHC5tDrN4uPMr1rUDN+FK6jEk+3Lch1GH2uMRpjUtnVxcc/FRomMDQ0Vsb4
	xPX6KXn9BkoZCzETgfQWb+Gxn7AROoZHnUf9nQtSJKjwyfgeiUTVA7uKmh0oZzw5b+P6jLd
	76w0wzBZmXdiQwcQavBZBRIISPHEjP1u96yiS08OBOBJ4SvvT4D5bdeKNGhipLsp3Cs25eV
	o1kfT1aM75rRcXA4l2MYe7oxDYxGcri77avvbxA1e2+kO5+peJhJ6R7wZ3cLypj3u1qZQYU
	GuUFxxp6J15JdD6PJg8teSh4XvxnObxgmtT1hyJ4MUfnyetnMQjFGVDrTow4pugXmnfsVng
	H3NCisUNcE7lXFGRPVz0NxTGVJQg1Ue7SL4n5y5EtdtyAIroFmW+LdRdR9Dszcun5LdS1ye
	gLRUlnnb2RnFIOutJErMfvBwrIaiSqEh5s1OLsH8LtdN3fjBxOtPrdKgD/rV0PdBhrqO8lp
	3IVpq2Z1WGtl4FucaROQq+VTU/7ZSOd4eWXtWCt9/vpSESKZrMKxy+XRSoJE0C7UmZL/bNS
	OQZt77k0OnYAo/VL2o0dUONnS5BqWT6+hPe83QpLZ6JJqEhaHnvlpqL9fo4I1oH6RWNi7OF
	S0iJUm2zAZuou18J6+ucwzCpIw73DU43DOKW0WqE2eNh0n3Hy0Ang2wntSmWQG3SbjTMuPB
	QZCOxDhdoGEVAERURswc7Ygg+Yeh0akyPptnioHwIkMdPXMos1dhWMAniA6iP1e8Ysd92SA
	yE8rvQBCRSAAdKBvzlDmsDGYQH7EXaa+a2MF7vBoirDOM/YMRA/l4TaReYXe2bzI/xJF9cx
	90ObKoKNCPKLIaemNMR9dN+SYrhH/GQVxtnRpjMonduLf6R9ws6WsaPOc+2QscJc8YHtait
	+NkFymnlRalur15fmIgO7AWi44INy3ISttAdM8EKzsu
X-QQ-XMRINFO: NI4Ajvh11aEj+Iu0khbXdVnalgkJNAcuFw==
X-QQ-RECHKSPAM: 0



> 2026=E5=B9=B411=E6=9C=8822=E6=97=A5 =
16:33=EF=BC=8Cnetdev-bot+sashiko@kernel.org =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let =
patchwork
> know by including "pw-bot: cr" as a separate line at the end of your =
reply
> (one such reply per series is enough).
>=20
> - [High] The commit message describes VF suspend/resume changes that =
are
>  not in the patch, and relies on them to argue that the new __rcu /=E2=80=
=A6

The commit about vf resume/suspend related commit, just merged into =
net-next,
but not yet merged into net.
=
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit=
/?h=3Dmain&id=3Da6c3e4c1f7032e44cf5dc897a3d328b138e770d1

>=20
> --
>=20
> net: wangxun: protect ring accesses with RCU
>=20
> This commit marks wx->tx_ring[] and wx->rx_ring[] as __rcu. Readers =
are
> converted to rcu_dereference() or rtnl_dereference(). The reg_idx
> computation moves into per-ring allocation via wx_get_reg_idx(), and
> wx_xmit_frame() gains checks for a NULL ring or zero queue count =
during
> teardown.
>=20
>> The ring arrays are managed by wx_alloc_q_vector() and
>> wx_free_q_vector(), reached through wx_init_interrupt_scheme() and
>> wx_clear_interrupt_scheme(). The probe paths call
>> wx_init_interrupt_scheme() before the netdev is registered; the
>> allocation path only publishes rings with rcu_assign_pointer(), so no
>> RTNL is needed there. wxvf_resume() defers rebuilding the interrupt
>> scheme to wxvf_reopen_subtask(), which runs under RTNL. =
wxvf_suspend()
>> holds RTNL across wxvf_close() and wx_clear_interrupt_scheme(),
>> protecting control-path readers and serializing teardown against the
>> reset subtask. The service timer and work are drained before the PCI
>> device is disabled.
>=20
> [Severity: High]
>=20
> Is a VF hunk missing from this patch, or does this paragraph describe =
a
> different revision?
>=20
> The only change to wx_vf_common.c here is the rtnl_dereference()
> conversion in wx_configure_rx_vf(). wxvf_reopen_subtask() does not =
exist
> anywhere under drivers/net/ethernet/wangxun/. After this patch,
> wxvf_suspend() (which wxvf_shutdown() also calls) and wxvf_resume() =
still
> read:
>=20
> drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:wxvf_suspend() {
>    netif_device_detach(wx->netdev);
>    wx_clear_interrupt_scheme(wx);
>    pci_disable_device(pdev);
> }
>=20
> drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:wxvf_resume() {
>    pci_set_master(pdev);
>    wx_init_interrupt_scheme(wx);
>    netif_device_attach(wx->netdev);
> }
>=20
> So wxvf_suspend() takes no RTNL and does not call wxvf_close() on a
> running interface. It also does not set WX_STATE_DOWN and does not =
cancel
> service_timer or service_task.
>=20
> The new comment in struct wx says:
>=20
>    Control-path readers use rtnl_dereference() while holding RTNL.
>=20
> That only works if the writers in wx_free_q_vector() also hold RTNL. =
On
> this path, wx_free_q_vectors() zeroes the queue counts, NULLs each =
slot,
> and calls kfree_rcu() on the q_vector that embeds the rings, all =
without
> RTNL.
>=20
> Can the service task race with this? Suspend leaves the timer armed =
and
> WX_STATE_DOWN clear, so the check in wxvf_reset_subtask() still =
passes:
>=20
> wxvf_service_task()
>  wxvf_reset_subtask()
>    rtnl_lock()
>    wxvf_reinit_locked()
>      wxvf_down()
>        wx_clean_all_tx_rings()
>        wx_clean_all_rx_rings()
>      wx_configure_vf()
>        wx_configure_tx_vf()
>        wx_configure_rx_vf()
>=20
> wx_set_ringparam_vf() is another example:
>=20
>    rtnl_dereference(wx->tx_ring[i])->count =3D new_tx_count;
>=20
> None of these readers check for NULL or run inside an RCU read-side
> section, and some of them sleep, e.g. read_poll_timeout(). Could they
> dereference a NULL ring, or use a ring after its kfree_rcu() grace =
period
> has ended?
>=20
> On resume, wx_init_interrupt_scheme() publishes new zeroed rings with
> tx_buffer_info =3D=3D NULL and desc =3D=3D NULL, and sets =
WX_STATE_DOWN. Nothing
> reopens the device after that. netif_device_attach() then wakes the TX
> queues of a netdev that is still running, and its carrier was never
> turned off.
>=20
> The new checks in wx_xmit_frame() pass, because num_tx_queues is =
non-zero
> and the ring is non-NULL. Does wx_xmit_frame_ring() then dereference a
> NULL tx_buffer_info here?
>=20
>    first =3D &tx_ring->tx_buffer_info[tx_ring->next_to_use];
>    first->skb =3D skb;
>=20
> Because suspend skips wxvf_close(), the queue and misc IRQs are not =
freed
> before pci_free_irq_vectors(). NAPI instances that are still enabled =
are
> passed to netif_napi_del(). The descriptor DMA memory, the buffer_info
> arrays and the page_pool are reachable only through the rings freed by
> kfree_rcu(). Do these leak on every suspend or shutdown with the
> interface up?
>=20
> Much of this VF lifecycle behaviour predates the patch. However, the
> commit message depends on the RTNL, close, drain and reopen changes to
> justify the rtnl_dereference() locking model, and those changes are =
not
> in the patch. Could the missing VF changes be included, or could the
> commit message and the struct wx comment be corrected to match the
> locking the code actually has?
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118081329.39551-1=
-mengyuanlou%40net-swift.com
>=20

