Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112729;
	b=obCzlkkYROXS3DgHm3763M60UDZ5NyemagIodmYgG3OAC2JLBUkb4yE5+ZePdFd7pJW8
	 nshgoMta63s2mMSlpvRW2Qe6QRVUIcbzeg+w8KJ1/q0ut60IglH+6SYscnSQS31ZnMTZV
	 ZlmXAOXgG2cnpsv/BSqzLTlazewQv+OIBRgLqAunh9NXDgm/GvrXyL/1nue52F4cieaAc
	 wAi57khtB9NO8B1OVBv3Dv+ZOkENXHQPkuDvAG9DVexMO8lUHYmW5JGQrAODXNzH9bf7f
	 a0yKVNcWthMzODk6ac5QXrw0mRrwq/uXGZyJuH92tEvy0lN+xYM2irYaqa1hb1k+Gfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112729;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QYTR6CXYPVK86JIgrNKT5REu6K13EPgN/tm8aKs5rDE=;
	b=xq7gCHl/BY7NbfxeYuFvNkAQHXkuwnoVOFNp7G0qBVDqMnnbB7ELHhBQNDyaLXES7bAk
	 M9+DNuYvVY5R8pS0RXG2tZdtnmHKxwIoKoWEXAQ2uovEfJq4LuIOTdUVq9ZTko/QaN5Qy
	 d2mfgMuyuO7zprdO9CoEamrRbWmqazlOYUylgOc7bjid59FhgwxPjqspCgvYIYeinbrEf
	 uV7kb9/KcpfgvsbiAW7LqD5l1H52qNXzkJmfrZ/e5B0Ign0h4duM613NneLHWptrp+mB8
	 3SxiLQWcRyBZu9fcYqTzg/kScJ2w9bbUgu7C/phNsDgoMSekbL5vYyp3g/yYXreRBaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EGu/8YvL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA56606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGu/8YvL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F30E1F000CA
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795112729;
	bh=QYTR6CXYPVK86JIgrNKT5REu6K13EPgN/tm8aKs5rDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EGu/8YvLt+3UC+eSVKkXFt/5D4qcRkHejvaEt/GEiK5nyWnTFDrUlNi208xzv18GA
	 MNTrWz1A3K8q/2tbTOmvp6mWjH5+Ensz3lBc1K3fEpc6Eg3eRBj3ry1MbrtarY90Iu
	 /zqPs5hje7M17ay7bneNitpasGrxm1QIkfMKMGwX4gezaxOtPVv77zUf5T7+LBPkBF
	 OcgWkutaia5gzrLOZ8zXNGxqMXmnIDkg6Nhi3QxNbSTrTQrUbVzpQMzM7x28MI6LGQ
	 /wGL9d0s+9TRZYEhHnk+wht3YB4bdnBMzTAif4YTHuAcBYmyz25FTB5Rke/DLc/zBO
	 zfEPkEgG27X5Q==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71ad5f20016so21068eaf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:25:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGnhMIRlHJwGE+SVIIVS7dFhBSG8vQjV1UUlb8JCgU3iKNK5O4W4LG7ykF1pEfGoribbS1Epdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qqWaDQb15AtM5QtWgYQv85TV8i98zFiQokOI67wvsqgWJnU30
	a0C9mHmPgEHcKiQXuN3uoq7TrvA/nVtHu2xmWRRwDVM1oH+F9J0c3xFo15EU8NKFdirN182Z8KK
	2xPSLiGXPduVW/e/8QMwHEtuqZYgdONM=
X-Received: by 2002:a05:6820:3397:10b0:71a:ee4e:17f2 with SMTP id
 006d021491bc7-71b394b4a8dmr350482eaf.46.1795112728290; Thu, 19 Nov 2026
 10:25:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118211439.1453635-1-edumazet@kernel.org> <willemdebruijn.kernel.68d88e182760@gmail.com>
In-Reply-To: <willemdebruijn.kernel.68d88e182760@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:25:17 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiqu32OHw1D7ZDgPd-aXhJVGb5S3ROHnM1y9YEK_vmkPBw@mail.gmail.com>
X-Gm-Features: AclHuK-x9jxojDwvp9PCkUq9apkB7ydkcQ_0K9Z7bYOLFBw8IwkmfriG_Np9Ys0
Message-ID: <CAL4Wiiqu32OHw1D7ZDgPd-aXhJVGb5S3ROHnM1y9YEK_vmkPBw@mail.gmail.com>
Subject: Re: [PATCH net-next] net/packet: wait for a single RCU grace period
 in packet_release()
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 18:59, Willem de Bruijn
<willemdebruijn.kernel@gmail.com> a =C3=A9crit :
>
> Eric Dumazet wrote:
> > Closing an AF_PACKET socket waits for one RCU grace period per ring
> > in packet_set_ring(), then for another one at the end of
> > packet_release(). A socket with an rx ring (libpcap, tcpdump) pays for
> > two grace periods, a socket with both rx and tx rings for three.
> >
> > All the RCU unpublishing is done at the beginning of packet_release(),
> > when unregister_prot_hook() removes the socket from the ptype lists or
> > from its fanout group. Nothing is unpublished after that point:
> >
> > - When closing, packet_set_ring() finds the socket not running and
> >   does not touch the hooks.
> >
> > - fanout_release() only clears po->fanout and unlinks the group from
> >   fanout_list, both under fanout_mutex. If it drops the last reference
> >   on the group, all members have already been unlinked, so the fanout
> >   hook was removed by __fanout_unlink().
> >
> > Call fanout_release() and synchronize_net() right after the socket has
> > been detached, before the rings are torn down, and skip the wait in
> > packet_set_ring() when closing. That single grace period covers the
> > rings, po->rollover and the fanout group.
> >
> > The setsockopt() path of packet_set_ring() is unchanged.
> >
> > Average close() duration over 20 sockets bound to lo, in a 4 vCPU
> > virtme-ng guest:
> >
> >                          before      after
> >   no ring                7.86 ms    7.76 ms
> >   rx ring                8.01 ms    4.01 ms
> >   tx ring                8.00 ms    4.00 ms
> >   rx + tx rings         11.96 ms    4.00 ms
> >   rx + tx rings, fanout 12.02 ms    4.01 ms
>
> Just curious, any idea why no ring seems to take twice as long?

Benchmark artefact: the test closes sockets in a tight loop, so
close() calls synchronize_net() while another grace period is already
in progress, and waits for the rest of that one plus a full one.

Adding a 20ms sleep before close() brings the no ring case to ~4 ms,
same as the others. In the ring cases, the PACKET_{RX,TX}_RING
setsockopt() (which also calls synchronize_net()) sits between bind()
and close(), which presumably absorbs it.

> Don't spend time on it. It's just not obvious to me.
>
> >
> > Tested with tools/testing/selftests/net/run_afpackettests
> > (psock_fanout, psock_tpacket, txring_overwrite) on a kernel without
> > KASAN or lockdep.
> >
> > Signed-off-by: Eric Dumazet <edumazet@kernel.org>
>
> Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks!
