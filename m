Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795211516;
	b=wIfHeKr7hfA3uTUWlWfos7I7xkDQejRxUJCOfmcWHI+Sl2AnsTMJhbbT0cJRG6lDHlTQ
	 HGJqQnfsctohMjsaoN39dmb8zPeUA1ACRUwiUcLjN8D6Q8Q2KEPSwB4YVF1QKaFf1ipqp
	 qICSFGdD2/+6RV4WqfeOYfXWAxp9BfoP2rxDurVFb3CYtr3AgCXFHdy46cyA4N3qHABkz
	 8r0ZcPvAdg94ek9NtnUZb9REi9TN0chhrEHZA97bM1mL04pVgN9o24SfOfQrhzYbGQ1JZ
	 9lxucRIFOLWZqMFKPflRCuAUDAjKXUqHdoXfdqiJ8h02QQ83tTKjZdP4PQ66G7n4RVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
	b=NuQ5QlxGsRTyGewseNhi6xqE5lKIO0HAugWtEDOEsGe23uzFG5mTOowRGRpYRL4BelGA
	 3rLtRfPUZDZKnZK+/zDYRcLr4itQMNQ49DkcQufZptH7zpN3vUpgp4UtaWNpBjSnz0/Ci
	 K6pbpKn09InM3hDSu0fjldzfQygycs3xK3GDpsbbqpoVEHphVPeaHpqLItNN3T7pM5xHl
	 +vxrOj5SGq4Brk66Y+MmWr/HcLRJG+fy/N9AzZ0F2P+WZjczYFJ9Hg29ts13O/ZKlWVTZ
	 TLMNhQVPLG5bhM0xlgYcVB2BowPXEwmUJou9ayqf2RwVMN4VAjSVUevCyucumy/A03A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=AgPu5J62;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B46606A6A1
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B46606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=AgPu5J62
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso811532a91.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795211514; cv=none;
        d=google.com; s=arc-20260327;
        b=WeXomkHFu5YZyZg1phUyGUiUjmfvcbi0O0fRtk5Ta1i1kKT42gTDR9lfN2qTMBOG0d
         psUkL47Y8eU4s18/HsicdeS3GWLbz/vOjbPDTwlqKiQPLrtz86vgxjDOjEPZSk3xLafa
         tSA3HePvSsfXTla6n4nYQwA185IVMqQ/2sPAweBUBtyF8AU+Qs/kUV50iPVt0Pz0j7Jx
         nzQ0+ziBveia/ylx2GkUUacokUvApq3GlSJG41x042vEDQ9EKGAo22lqplBdvnv+p0BL
         LF08LePbdtXl1VUNQQ1xzfzWUzWoTLuEpuZ6m1CRwTB3QmgOqLorwK1jqFdvl4PWufZ0
         MQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
        fh=ADrsBzH62gHixN94Olycijan1m+JDYluvpLAKCkjtcQ=;
        b=TUHHF3tjwusBnhfFMITAJcjU82Bj7/3m6ovEJWPguRSCqU9oZxIehCPfqxfp2vCHOn
         QrIP9m38gwT+lW/e+m89xm/BZJVscVIO2kCy5fgVdHPzDFSExaddf9eL3WGTrQiXFGk1
         HVbp8oJAt0jvTTZlUIkJk99vkrZwqrqNAvAwWybKJJuMfugB2X1+UVwn1+1jwvxXYrMx
         WQGi5ltgRujx4dYNJ4reYqGXH4KbchuKLt08GhwJD63L2vnBI2/OcPob5bvjeBHEMVX8
         1K5dpIKwRH3UDP+F9RTV5FsYo1vFNUgtOly8PEEwzIjiITDU4sfoMF/KwdjCYvGIkIUW
         IlMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795211514; x=1795816314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
        b=AgPu5J62QchcMUFXnKGeHGbhznBH6/4T7KsyEkUOY27M7C4mEFFSzy3D0ukukqTs+v
         UdDLQh9qODUhqfGqFsRY3RqFnN8uTMHP1xeNP3cvDMwmgCPX4Mh9/RW5fC4sFN8V0uTn
         rU7AJPDQYLS821tOzruzDeD6nTadcmIZcqcMg8/4CMjmseE7wxWIgYPV4emZX9th4PF/
         eW1doKHM0VaUDJeBjIj5UGavF+VbJvuhjne7xwCi5+CvJ9jFe4lnge6932l/u3shVWyB
         WP2/riBG8FPPVN5srrNlbcNZ/Er2N1sDRsJb8wvAsxiv4vGiQ3YH3XA0C+ow9fDDXmBH
         jbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211514; x=1795816314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXn3BxyfcaTRVPKnRds+vZOyXItuUDy8pAU3lM3mH/k=;
        b=UAeUXIivBPTwSfMi0bOTTqK8h4B5U21VNGKa2k7bxa71yTgjaO5xg5bdZWLIdMPUWX
         kYbNXQ0LE1fcCbFKbtAZmDypdtqeItSuV2Ypp4gWAh0n/FJTrvPfc3QvNnFnB1AwT0il
         nB9WQrxWso6jdGxl/WA7ajN5FhM8lhSRcnQ3Eu79wOF+4+5/WqoNQ342k6BNvlAFX042
         bJuKbmJMZrsDEQjlECinE3mgALspxsNn415iB6sbjSMs3vkWFu1EgHVzHhhg6mzlzw9p
         us2J0BYDd5t9wkERSe0V/d+R91RHH/cVvW+9hw/zUkiBKpqdrHBfVrAmeF3pzcZJH+KS
         gdkQ==
X-Forwarded-Encrypted: i=1; AL+hErFo1H7uDVtgRq8gkYZR2PHRoxwdPzn+eWr0Ky17Gdc4iq7oRWxZ8N2MLmjgm341ro0T82bB7NE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/erobqfQtvgb9XdG2UDui4STsUA6LrWdyl9IYt0A45rYaADJxr
	OeuZmR6Kv+arVp6y39+rO0Qqc2MxfBS/bDqzRVXPilv2/zHafTEfvGZSuvltg2iAufIoYrUNwDG
	Q1Ol/YhciDorFeptZvQHiPDPmHNTIsU4xnCJdeaK/tHkejn3gdEFbSA==
X-Gm-Gg: AZFdTZdAHpCOUMt5D3X3pRA9l7HHhvjLXwj6xlGSJdOYQs6oNnTMiluY+IxaWtfZMNI
	hlh//pFikELj3PcMspfnHwhmUxReYtnaaCDFsjdKQZVFkbp26dcpl+WUWmJKxDMFoXhn0h0tNAk
	VBTcXHm79LVCO6RpdKY0DlU28EKm4gV6hS47Rt5MSudz/+qfzdl5g2p7q5zj1aA9rLgpXA8G52k
	iPGhAKDzXzaYofuRVCzw54woXXCAfPEdo9j/LSXk10dkpOO4FbTdNIQqyBjCbn0WgRaSwF6qwH5
	8dlVeOvNvf8CDW4b5U6RsxYDhiP1F+E1nFxhWXemcepkoUIoGsAiRDDNqJZw0xa9BKmcd4+Uetv
	SNoZ2iX5tNFCYKjx5sXLy7OBs2gPp+8GQCcr7Toni7yVlZjX2OPMzABgV2r3z6GXd+PbJ
X-Received: by 2002:a17:90b:4d86:b0:3ac:7c52:faeb with SMTP id
 98e67ed59e1d1-3b41c93b0dfmr4530278a91.41.1795211513818; Fri, 20 Nov 2026
 13:51:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115144508.71543-1-jiayuan.chen@linux.dev> <cbaa372f-6ec1-4ceb-a012-30eaac5ae8eb@redhat.com>
In-Reply-To: <cbaa372f-6ec1-4ceb-a012-30eaac5ae8eb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Nov 2026 16:51:42 -0500
X-Gm-Features: AclHuK_GGiWFUVKZSpr8dYR-2FHgC-uowX04GimNX21-i66RpifdzgYCCqwHyG8
Message-ID: <CAHC9VhTBf7wHMsneqUTT0p3pABkbD0GHuTJXFehKhA10NvWgxQ@mail.gmail.com>
Subject: Re: [PATCH net] ipv6, calipso: fix data-race in calipso_cache_add()
 bucketsize check
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Huw Davies <huw@codeweavers.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:26=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
> On 11/15/26 15:45, Jiayuan Chen wrote:
> > Issue found by sashiko when reviewing my data-races patch [1]. This is
> > not a plain READ_ONCE() annotation like the rest of that series but a
> > real fix, so it is sent separately.
> >
> > calipso_cache_add() reads calipso_cache_bucketsize twice: the "<=3D 0"
> > guard on entry, then the "size < bucketsize" test after taking the
> > bucket lock. A writer can flip it to 0 in between:
> >
> >    CPU0                                    CPU1
> >    calipso_cache_add()
> >      calipso_cache_bucketsize =3D=3D 10 (> 0)
> >                                            proc_dointvec()
> >                                              calipso_cache_bucketsize =
=3D 0
> >      spin_lock_bh(&bucket.lock)
> >      size(0) < calipso_cache_bucketsize(0) -> false
> >      -> else branch, but the bucket is empty
> >
> > On an empty bucket the else branch takes list.prev (the list head
> > itself), list_del()s it and then list_add()s through the now poisoned
> > head:
> >
> >   Oops: general protection fault, probably for non-canonical address
> >   0xdead000000000108
> >   RIP: 0010:calipso_cache_add+0x2f0/0x380
> >   Call Trace:
> >    <IRQ>
> >    calipso_cache_add+0x4c/0x70
> >    netlbl_cache_add+0x4a/0xa0
> >    selinux_netlbl_skbuff_getsid+0x1ac/0x280
> >    selinux_skb_peerlbl_sid+0x7d/0x100
> >    selinux_socket_sock_rcv_skb+0x2d3/0x460
> >    security_sock_rcv_skb+0x86/0x150
> >    sk_filter_trim_cap+0x56/0x730
> >    sock_queue_rcv_skb_reason+0x1e/0x80
> >    rawv6_rcv+0x679/0xb20
> >    raw6_local_deliver+0x1f0/0x5b0
> >    ip6_protocol_deliver_rcu+0x215/0x9a0
> >    ip6_input_finish+0xb0/0x1b0
> >    ip6_input+0xa8/0x250
> >    ipv6_rcv+0x14b/0x1c0
> >    __netif_receive_skb_one_core+0x8f/0xe0
> >    __netif_receive_skb+0x23/0xb0
> >    process_backlog+0x27a/0x950
> >    __napi_poll.constprop.0+0x61/0x2c0
> >    net_rx_action+0x372/0x800
> >    handle_softirqs+0x109/0x570
> >    __do_softirq+0x10/0x18
> >    do_softirq.part.0+0x47/0xd0
> >    </IRQ>
> >    <TASK>
> >    __local_bh_enable_ip+0xf0/0x120
> >    __dev_queue_xmit+0x578/0x23f0
> >    neigh_resolve_output+0x278/0x3c0
> >    ip6_finish_output2+0x4b1/0xcb0
> >    ip6_finish_output+0x2b6/0x6b0
> >    ip6_output+0x122/0x400
> >    ip6_local_out+0x61/0xb0
> >    ip6_send_skb+0xa0/0x260
> >    ip6_push_pending_frames+0x2b/0x40
> >    rawv6_sendmsg+0x1b7a/0x2750
> >    inet_sendmsg+0xa1/0xb0
> >    __sys_sendto+0x2fe/0x350
> >    __x64_sys_sendto+0x7f/0xb0
> >    do_syscall_64+0xe1/0x450
> >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > Snapshot the sysctl into a local once and use it for both tests, like
> > cipso_v4_cache_add() has since commit dd44f04b9214 ("cipso: Fix
> > data-races around sysctl.").
> >
> > [1] https://lore.kernel.org/netdev/179428999963.994134.1690454450089005=
3668@kernel.org/
> >
> > Fixes: 4fee5242bf41 ("calipso: Add a label cache.")
> > Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> LGTM, but let's wait for Paul's explicit ack.
>
> @Paul: please LMK if you prefer we apply this kind of
> simple, clean fixes directly.

Looks good to me too, thanks Jiayuan for working on this!

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
