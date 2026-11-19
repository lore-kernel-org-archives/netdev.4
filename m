Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117005;
	b=PRXmvczakIwE/kyD1XK9kYPwrlOELBk9FoH4njbLO5Jth4WCj6cr81roL2BeVIwFXNXB
	 9DQ1nPxw688DkfsPpjahyIL9OnjT9AEW7vZ9OH2F91O8i5BrT9jPCNtT3vTkj3Fq0Si6D
	 0zNyEddalXvShabH8e1ybqNYM072e14WHaWCOEwZNdjSnvRbII3FR9amAH0Y/jtCUky70
	 kUm3iJX4/FtpnenvAWGITkkdwhXdt7zcxwja4waYSJEyMiBKdru9y/HrBN2C8aJccMH/C
	 oNaU09vPDOl8nT7pjokJPP/mPImw4JC0C/XcbCiwhUU1kxabL0raLK/pP6HGQuWsbfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Z/2L9IovMD4zBIgZcsGeAkwPGqc72zduF1TmecAsP2U=;
	b=JuglhaRonAMVQNXWQWcysjFUvipr5ck+SL9aWaq75wRd8X6XaF145tJVpCQmks03P6xg
	 /lvZzR6LF4MpXngAk5IjsmTi2HESitUTDcptQBwSE/9Hi7wQc/rcG/+dLKZ9GGCTch7vt
	 wKuihA7ACN+R/oqH8m6rvz1JTihrATHDZFol0RVTQ9OqxyLvZppAvpC5bFujk6N7eYDM+
	 Ufs4HLPxFIVooCk507mBJh++wn1Ql2Bx8j0YbXGDxZjP3iPPvT6pKhcxh8TJrZzlOSXKi
	 zZzlyhCd5nrYyeUfuaB9NXEZryU0nLQQoASvPKmK3YhkNr6rljMItWoP5nWBEticP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUKTHXmP;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFD606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EFD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUKTHXmP
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716d052dc23so57380eaf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117004; x=1795721804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z/2L9IovMD4zBIgZcsGeAkwPGqc72zduF1TmecAsP2U=;
        b=WUKTHXmPDsd8bmISSW+LqyZEPEQsRE4kJ67FPXvLSxtN1Gmsu2ddKXNZgsXZUWUwlX
         hTP0Lu5Przzo9ho8j1uFMOKolRcvpszRuWOMtitvNE/J1tAcwKrhu0FSRXVHewX0bpZZ
         MiI5q131r/I2/UIgTUYGB9lP3lSqudnWHs3z44w403i5AG6QNxSi9KLbJluult3ciAPo
         EyC+BJGtrDCIm4Ic2a4gLUJfDPHa0JxqcSU+gbl9CWU9kLRa+YzsMc1xfQeqrH9Ug+XP
         Flg/hRH7BCgRObF84+fpRBD3MaLKpk8+hIE/dzkyEXUIeDrdOhUEKV+ZkaCdvAeJkX9H
         xsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117004; x=1795721804;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/2L9IovMD4zBIgZcsGeAkwPGqc72zduF1TmecAsP2U=;
        b=IWszIJ7aH8oSN2Gt9KeamhmrxHgYzKE77appIQrWgBjgr8Cg70dQnELSDN2O/yNrZN
         pIxoupKm31VPUt/DJVLLwz4wKxZB3Akib8SV6ypgvQOZUINjgi584NK+c0LnXOA4qN8v
         AoDVN7H8ARIxleFKYJAHo810VkvEoVCPRhEoOBpXxmq5A+zpbfOWoZFNI9Bc71KfgYry
         uA69JhEV2JZ6sNRChGTd/r1SKoER6dTtKtArRn2lq+UU82FYRtYsNK/DxfkYyQ+x+bbg
         pzjAveglm7TPwv2RYkM1JkLsXTclEop4EdAbDBoBlIJaD38uONeAacmrtvRWPpJuWdPT
         mZYg==
X-Forwarded-Encrypted: i=1; AL+hErFjjt5XE2o9o1RTYnGLs9Xds7oA0MU3LjzPzHb6C6JQooBymSNnBpnyqXWos5iD78BZp5hR5YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DL4n6EXrikCNIxu7s13KLgdueOgmri0vZrf4v34Mx9I8DncFE
	10i34tmbME9TkM3sIzzkAjZJJF2EZdg5IXOxb0ppZKirNNoGatrmUZVpleBH2A==
X-Gm-Gg: AYBFou1h+LaZPZAigw5o4wLD0N8dFs14lihBb7d2ZJ87hgWC11fqtWRNo82HhvL0nwQ
	w+7Di3g4xPWb5bTdCFEUt6Aejo7KbnmA01nVSZ9dpTKO6dnvF/SqXnYOwsV4rKfN/381ZBhOCkK
	LNckIq2LFEgdoIaZRnpaIqV5JROKXh0Dvz/8S4MihnmgQ89aRnsjpmFuv10XEGCmXSwlYZrFWpe
	qmhYS9oa8qeTRY41DEQI8hin4PoqNHcZQP1vaiWgGtBPftcq/esNcgrFsScW6+qR/7ZlLew90jg
	5sHFYAg8o9ny+YumXOMgNQ3nwVqjAot01yMur+HbaIlUPC6QcK1OggWy4SJpVFm1+iPm3CYGSL6
	d/gYzpMNiGHErK0VF/iN8XZ7dS3dsR2TI/AGew2jpTMZbfixFvy8OpWdsqVssYrSf+ZkeYvl7ji
	AP+I0GW6WVeK18PtavgtVC9UnqcRcLC8SS+gGWOoAqVzy4TvbWBsQPfRHNOYPgf1uU2/rby57qN
	Kmerv2/FDK+uI+7hxkKc736dgRbPSKMcQRGXlyIdDMqx2v2rWG0kRLV889HVwpF3JEQsREa2Hrq
	deP+sSQIK84aJtE6n7jDAB2zkSOcmSwTJ/SZMQEjus62GB7WaoPU+0fKRXo9uYaIXTa0g2WaE5c
	i3W+cz2bWS7Tj5RLFNpcsnJyD8H9bF+ZX6BCOnQgYdsf+tGr2jKKgvhu3lsKEiY6VsH+wHtUlHN
	9s74g1+Z1iMg==
X-Received: by 2002:a05:6820:1c98:b0:6b1:bb82:f7a3 with SMTP id 006d021491bc7-71b39209557mr740286eaf.5.1795117003758;
        Thu, 19 Nov 2026 11:36:43 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6e7sm435223a34.12.2026.11.19.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:36:43 -0800 (PST)
Date: Thu, 19 Nov 2026 14:36:42 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>, 
 willemdebruijn.kernel@gmail.com, 
 jasowangio@gmail.com
Cc: Antonio Quartulli <antonio@mandelbit.com>, 
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 mst@redhat.com, 
 eperezma@redhat.com, 
 ast@kernel.org, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 john.fastabend@gmail.com, 
 sdf@fomichev.me, 
 maheshb@google.com, 
 peterpenkov96@gmail.com, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 bpf@vger.kernel.org
Message-ID: <willemdebruijn.kernel.24840892273e@gmail.com>
In-Reply-To: <20261119153056.353156-1-antonio@mandelbit.com>
References: <20261119153056.353156-1-antonio@mandelbit.com>
Subject: Re: [PATCH net v7] tun: bound the NAPI receive queue
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Antonio Quartulli wrote:
> With IFF_NAPI, tun_get_user() queues every written packet for NAPI on
> an unbounded list. When the poll runs asynchronously (threaded NAPI or
> ksoftirqd) and is slower than the writer, the queue grows until the
> system runs out of memory. An unprivileged user can do this from its own
> user and network namespaces, and the queued skbs are not charged to its
> memcg: in a test VM, a uid 1000 process limited to 128 MB caused a
> global OOM in ~6 seconds. The socket send buffer does not help: tun sets
> it to INT_MAX by default, the build_skb() path is only used while it is
> INT_MAX, and the XDP batch path never checks it.
> 
> Drop packets once more than netdev_max_backlog of them are queued, like
> enqueue_to_backlog() does, and count them as rx_dropped; the write still
> reports success, as for a full backlog. The check sits where packets are
> queued for NAPI, in tun_get_user() and in tun_xdp_one() for the batches
> vhost-net passes, so packets consumed by XDP or delivered through
> IFF_NAPI_FRAGS are not affected. A dropped zerocopy skb completes its
> buffer when freed. The check is lockless, so concurrent writers can each
> still add one packet.
> 
> The NAPI poll moved the whole queue out, processed up to its budget and
> put the rest back: while it ran, the queue looked empty to writers, so
> with the poll on another CPU the backlog could still grow without limit.
> Take at most budget packets instead: the rest stays on the queue writers
> check.
> 
> Dropping also schedules NAPI. vhost-net sends with MSG_MORE while it has
> more packets, and tun_get_user() schedules NAPI only for a packet
> without it or once more than NAPI_POLL_WEIGHT are queued. With a
> netdev_max_backlog below that, the queue fills first and the packet
> without MSG_MORE is dropped too: nothing would schedule NAPI, and the
> queued packets, with zerocopy also their buffers, would wait forever.
> 
> Reproducer, as an unprivileged user in a new user and network
> namespace, without kernel modifications or fault injection:
>   ip tuntap add t0 mode tun; ip addr add 10.11.0.1/24 dev t0
>   ip link add d0 type dummy; ip addr add 10.20.0.1/24 dev d0
>   ip link set t0 up; ip link set d0 up; sysctl net.ipv4.ip_forward=1
>   install ~500 iptables FORWARD rules, to slow down the poll, and a
>   MASQUERADE rule on d0
>   open t0 with IFF_TUN | IFF_NO_PI | IFF_NAPI
>   echo 1 > /sys/class/net/t0/threaded
>   write() 1400-byte IPv4 packets for 10.20.0.2 in a loop
> 
> Found by code inspection while analysing the performance of the tun
> write path. Tested in an x86-64 VM on net, with 1 and 2 vCPUs: the
> reproducer causes a global OOM without the patch, while with it memory
> use stays flat and the forwarding rate is unchanged; the tun kselftest
> passes; a local vhost-net test of the batch, copy and zerocopy paths
> with netdev_max_backlog set to 8 passes, and fails without the patch;
> an XDP program on the device sees every packet while the excess is
> dropped.
> 
> Still open: neither the packet size nor the queued memory is bounded,
> and the skbs are not charged to the writer's memcg. A single write can
> create an skb of several hundred KB, so even one queue can hold a lot,
> and IFF_MULTI_QUEUE (allowed in a user namespace) and more devices
> multiply it. This bounds the queue as enqueue_to_backlog() bounds the
> per-CPU backlog; charging the skbs to the writer is left to a follow-up.
> 
> Fixes: 943170998b20 ("tun: enable NAPI for TUN/TAP driver")
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
