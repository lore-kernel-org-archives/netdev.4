Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023567;
	b=oTeuOy6+4ca2sQYDl9CxPcXhHon2TXowD/VtmrIcnQhTvW+SeLBOIs3rCdBtQrq4UR7s
	 d2efgKmqcPG/aX5PB/VNI05mWQSJL16t6wTdpNjvIzsuYgIyS3O4ylLosy2r6kCvbgITR
	 Lt9+lvI64M7n7D9Mg0E2ym6vjIRVvqZBhv3LkipY2Bj024eVNryv1azRB6VQvUyIgBVzA
	 1cDkKFIMH3Gbsi2ZENsu8VGkV9By7GE1NrN3bnpzmQu6J8TxWEDPNEp9pxknGbsF0++P2
	 n+Lu+rhyz76zHABaMnwLyCT44PHqVuxKLnyCTwtIAEJ5pKtrrfaTXWAsli+SEnPnvOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023567;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
	b=G1+qckDbiI8PN3DSEXdwc2CXlYIKHsdsO1Y6WTAZOCBb2/rnkP7l6mdP7kExPIwkw6dv
	 o36YYlhYLytdk33Lu48zTRhaj2idTdqzrN+5sia16YuLDbZ3fCeYzF0qr7UbU0Rhwo13i
	 U+qUoneCCySF7XD5IsSGJ5Z0QJGbiRYiU1r4oNg75NDuviRKNqeGtwoovAzHbA0UNX0KK
	 9Nx8evJftfK7m3smi2nx7EXoA6ojHrbGeASEzweKxQbH+HN0eiJz5Ei4v3bxXRKRFr7Yt
	 67MkP4Z+gvKGldmhIck/znfJOZb9mf4Jhy20a0b20+qUqGM9Pj897rT1snou9W0YQsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOAs3cxA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l3G1leI8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B530606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B530606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AOAs3cxA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l3G1leI8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795023565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
	b=AOAs3cxAXLgE97nif2cVF0meJzMphmpth92K8JYGwId02tVhxHcJ7QR1GxuK1KG8AZcLxU
	r3lXWzgyecQpH/AipaPqZ+pQeR7QjZB0C+aoDvxdhi7C82Jns37mZ1sVWnxPZ20HoYN4uA
	SVneDjN8kNa4GYPYLT+SPYh1J1IvPQc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-WnnwOyjoNOCc_9V0tzVaPA-1; Wed, 18 Nov 2026 12:39:23 -0500
X-MC-Unique: WnnwOyjoNOCc_9V0tzVaPA-1
X-Mimecast-MFC-AGG-ID: WnnwOyjoNOCc_9V0tzVaPA_1795023563
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso275567f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795023562; x=1795628362; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
        b=l3G1leI8ltKAc37JwVJMpYJ9DawjRn7+xaVkiMmtrOcmmhH5zLInGEdWBif4dedunZ
         7GK+iZcIMTzaC605VXADwuHdIiZ0AMWUY8Zc7XeXSTqDPWtbtZILKtNQpgn6uqkAcxhb
         d7P5WVRi8i9MVdumDMqGcDvQGO7eR57MUBWE7aYpvVeEwihZE2VpR0h20pnurlSQaxvz
         jwr4z7TGCdBuzO4nvfwjKoEfMXZNck2mECGXTAH2yQwdv8iXDVML/6wjE0OV/cUNGY6c
         Gh6eSP01otDNmJVRimRpCQ1TDKk68uvAx/QaVgfKEkUBK9yCYQ24RRRR3Y/SSlfEOWie
         Xj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023562; x=1795628362;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yBxiOK5DN0DLcC/CotX6KF4rNg/SuetAzgTjUp8Dd0A=;
        b=L/GQb7dWvmc+1xAhMPO1erhFFtm8Dx/6lrDpFUgBpwZN3MlJhHOt/saSjvVSZDkdMp
         2/k29BmMbJjn39pRJa5/NakcZGIge7ig7YRmUMQaOofeEnJdZf2YFOpddRiF31mwGE7Z
         FEPcnlz8ugiRP6l2XLy9oIpAkQu/tT/FNtpOPIKXil7jVFBMaWcyqsZSFMEKKnN4chmm
         sKCspFQmSnUyOVfvn06xTRZBMUK0chFRnhoQ9m4hhN/S6jAWpMmN734ZsgbdJcH7uTL8
         88daxoHEaxDayJbth52c3/0zB0W26Y98BntxBETpkJfUZRQky5Gdfdvd/td6LygFTACk
         3c0w==
X-Forwarded-Encrypted: i=1; AL+hErHKIitegQMmj1dvtLtUGkueWjKxvb0HZNdwfo9Lx5pKmWbuY6IRswJeejcHLg4T5+MIhT6e0DQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XSYy8uT9i2+We/YOAkufnDT93mVtAMGHgVuDQPSyH5f6ni0Qc
	W7xacNTIea61To59pvYVb5WgZ9WBbRs7Hzqn9E5WM6NhfJzHf2VvMqFdVnxPGc5hAnQQ9QLgnLz
	wu7IO6T68qCRBFmzX6HpUYW7tofTU3dSQQK6EfKzUx0jkFGX1yqdxckr/ig==
X-Gm-Gg: AYBFou0ScNFt8fXF2F2f+FrE1ya/io9q/+1iAnyXyRu7c2yrvnd2PmpnllBW9C5mOMv
	LpX2/tMevYFz9PBLBAb+yg6Qh4Cdr+53EQ4JMVJdrwoxUciO+lpqSd4Cq4tWbuc6iBAPfNxrdkP
	DsHfs5uYk7azryhloI98bVCrKBiUAr4fOU3pdbpf2nUx28ahr1wl265T/wyUYVg284nnypGOdZC
	9XTAW4CM800fZYSlPQLwaTL+/KDDf27HqJgu3VH9GahZoG1wrt8Q1tKWQIHYUIzo73xwxnqQgb+
	xVWKF1agQm/iwJN1S6YjuxVwA5cpKjh5dY75pSOuywSyMWrLrZRsXvfhUzy5FTWHPE+SfTRaHwn
	8CCbUT4NqyjKkVgGMtcN1h65cl66mggJK6ayzcGtUV6x/uhB3L6GwRpzA7xOWezNd7EOwcIEUNW
	uvzh8=
X-Received: by 2002:a05:600c:4ec7:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb7da3b3e8mr67029905e9.27.1795023562633;
        Wed, 18 Nov 2026 09:39:22 -0800 (PST)
X-Received: by 2002:a05:600c:4ec7:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb7da3b3e8mr67029645e9.27.1795023562258;
        Wed, 18 Nov 2026 09:39:22 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.39.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb83264660sm3892105e9.12.2026.11.18.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:39:21 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,  Ilya Maximets
 <i.maximets@ovn.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  netdev@vger.kernel.org,  dev@openvswitch.org,
  linux-kernel@vger.kernel.org
Subject: Re: [BUG] net: openvswitch: WARN_ONCE in ovs_fragment() reachable
 with a user-supplied MRU on a non-IP packet
In-Reply-To: <179492834266.3639154.14679778183890331729@gmail.com> (Kyuwon
	Cho's message of "Tue, 17 Nov 2026 07:12:32 -0800 (PST)")
References: <179492834266.3639154.14679778183890331729@gmail.com>
Date: Wed, 18 Nov 2026 12:39:19 -0500
Message-ID: <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Kyuwon Cho <kyuwoncho18@gmail.com> writes:

> Hi Aaron, Eelco, Ilya,
>
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that OVS_PACKET_CMD_EXECUTE
> can trigger the WARN_ONCE() at the end of ovs_fragment(). An unprivileged
> user can do this from its own user and network namespace:
>
>   Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>   WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>   CPU: 1 UID: 65534 PID: 106 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(lazy) 
>   RIP: 0010:ovs_fragment+0x24e/0x840
>   Call Trace:
>    <TASK>
>    do_execute_actions+0x580e/0x7380
>    ovs_execute_actions+0xd3/0x3e0
>    ovs_packet_cmd_execute+0xc21/0x13c0
>    genl_family_rcv_msg_doit+0x1e0/0x2c0
>    genl_rcv_msg+0x42d/0x6f0
>    netlink_rcv_skb+0x11f/0x350
>    genl_rcv+0x23/0x30
>    netlink_unicast+0x518/0x870
>    netlink_sendmsg+0x849/0xe20
>    __sys_sendto+0x36a/0x3c0
>
> OVS_PACKET_ATTR_MRU is taken from the request as is. In do_output(), a
> packet longer than mru + hard_header_len goes to ovs_fragment() when mru
> is not larger than the port's MTU. ovs_fragment() only handles IPv4 and
> IPv6, and treats any other ethertype as a case that should not happen:
>
> 	} else {
> 		WARN_ONCE(1, "Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.",
> 			  ovs_vport_name(vport), ntohs(key->eth.type), mru,
> 			  vport->dev->mtu);
> 		reason = OVS_DROP_FRAG_INVALID_PROTO;
> 		goto err;
> 	}
>
> With an MRU in the request, any ethertype reaches it; we used MPLS
> (0x8847). The packet is dropped either way, so the effect is the
> warning, which panics a machine with panic_on_warn.
>
> Dropping the packet with a rate-limited message instead of the WARN, as
> fd954cc1919e ("openvswitch: switch from WARN to pr_warn") did for
> ovs_dp_reset_user_features(), or checking the ethertype in do_output()
> before calling ovs_fragment(), should avoid it. We have not tested either
> change.
>
> The reproducer runs as an unprivileged user (uid 65534) that creates a
> user and network namespace, creates a datapath with an internal port,
> and executes one 1434-byte Ethernet frame with ethertype 0x8847,
> OVS_PACKET_ATTR_MRU 500 and an output action to that port. On an x86_64
> QEMU guest with 2 vCPUs and KASAN (gcc 13.3, config attached), it warns
> in every run (7 of 7).
>
> Checked against v7.4-rc3 (aebb72744764); actions.c is the same in
> net-next (6ff4c5942a30). We found no earlier report on syzbot or in a
> web search.
>
> The reproducer (repro.c) and the kernel config are attached.

We can change it, and I think it makes sense.  A ratelimited warn seems
appropriate.

Did the LLM already generate a patch for the issue?  That would helpful.

> Thanks,
> Kyuwon Cho

