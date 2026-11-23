Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795423970;
	b=ED61FVCSBUWQUEgnN32nd1wlJ3KUrpFp1raB2nV7rKvuaeKqM/TxgUk5SXF7zXBn5qzX
	 ofVDgAwDhjbbBINkdAOSYGOj0dwqUPj3JOmbvolqZFq6wIThzV1nT/bknxC92+5Cwv3xo
	 qPYeqSjv9ac1rzJm16gOsWu7QC39weDjlGojpf/C36hQOFj5Mb29pvHdYHSNdUKw9x0uu
	 LXqXsMgmUswOMfpcyXATV3/ThYtAehXSjh4AGCAhH/8qFGK/Dgrv0+AXt5OPYzUfaqNnK
	 2NMbgWpiMDDSf3/1iD7wPtzGGM2D0WMU9Mjd+49qCIZ5BevChwOGt84SweG26rGQNgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cBy8a6PARV8Ud2jYBKY1ifWsHzxGDdjHTpckRaboeTA=;
	b=tPB2bmAo5W23Sr3FZw1j3HunnBjncMdgZmdeTkRsd9WFyzlU6icq56mXETQppI9fJYaN
	 OjTaitZ2q+M5UXuKaS/eul0hHJmvYCcGCCh/xZWjiJv1ERshWVBkNpq17nsVr7em88VcT
	 01Krg1g8GDBwC6D9dm+OA2FKQvbzDKd/2yD7I8AaYkOFiXN9RMaYl2uQsjyStOF6/L+RW
	 kGrQVYFgpG2GMk/GjjzqzoDQao+MdhCHKiONf4kMjSgy4o9RCSCe2eWTH5d/TqiLU3P5r
	 epWcE2FSF62qSXoclPurYafgalZZw3FsEQ8yEkm9ov1xzJzMxAMlQ0TP635XWjmIVxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1bEhEZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA655606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA655606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1bEhEZs
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1712907a12.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795423969; cv=none;
        d=google.com; s=arc-20260327;
        b=bIktVFDnNQF9dBwXMAloWQjElo1BNHOOUydlPc1vEfSGStwYQATaxqK5fN019Ywp+K
         OuisIvsGaxLA0VrsMyflB2wZ16tt2xt6m8nbv+3ctfvaDhNn3xmeSMYMwP3dD08NP8XE
         g65Hqsh8F03gVJIy06cqU4EjHdC8ACXPf0dxH92Pzlt+fzMCtrRCL/6wDIGZmojqsM0j
         0QDgknB5Qd6mCiTNJG89GyBuCGJ5gM5zQc6Kn6aWKcGsJdoVjLutLy+S52czLJbnByT8
         Gq90NO+Id3Pflbevla64d2vjKF0TUgnQZibi94dpM7ZzKJWP7OjRIaSYzzh1XjUyrs++
         GkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cBy8a6PARV8Ud2jYBKY1ifWsHzxGDdjHTpckRaboeTA=;
        fh=nsi80plfgd3XumQbBfxWXunT09RstUwfljz6jueyTPY=;
        b=NWQUS9rEaaf3y/w1F2moCUjln/IS8gySdYxmUrO4u93ETjpGnP4ZwDM+76dJQSlGuc
         cAuRrQiNlWOxvl57cH6YYlX31Es0DoSdZ4oEySZvc3Oe/Ns2Js4dNVFFzDLgSMPsjJYO
         Cgq8l8fEDApt/Wcmb0ouJ4w/62mIxNwdUPvavh5z1uiMs/oZEWKmsSHc4z8k0Xj/ldpf
         TTthAyDQbAOHrchNKnRQpQhOv3nUSvuf3GC1RP2rhluAEP9CrL5PVEwABL/skHMkfpv+
         aKufDXIGeeG7E4SvmokJ1jqhATkHNjuA3f3Zr8ynX3Wm3KYJgF8xc5sybBG3wGLLJ4++
         gz+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795423969; x=1796028769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBy8a6PARV8Ud2jYBKY1ifWsHzxGDdjHTpckRaboeTA=;
        b=a1bEhEZs2rYNhjJTFywjiLaVDjKFt/pMMFrPFNZKsODaOg7ecCKpsc5Pe5A5XC5HU3
         iZsdCeaqNEby2rJi9kXAvYr4tNHPrg9dSUwJ5te0YTS86tj/RRzsw7WAA1tlftt8TQKA
         2qQbx6R8p/6SfOv+dZfoCXN5bcb/JuO1c80+IWAUV5bRhtPHOwof1vWMCuwzuZI6QNsC
         72NT+tvep8r5loSteMfXS1R+/DiHrzndfWytAq8Zht5LKQM/OQKlOcsWDTfEOPkb/HuH
         f1PUdnW5ANQyN6DqEM+ej6sHpiL8Kw02yTRNOn2YkLZ8Ttpaf4VyZSSiD01wQHbBOf3j
         NLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423969; x=1796028769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBy8a6PARV8Ud2jYBKY1ifWsHzxGDdjHTpckRaboeTA=;
        b=DC3eKTQYP+lkWWkyIfDR+qwEJJRc28dc0Mf50BdpPHPVMSIvQ5yqzJ1wxLQQnjB+2l
         YgVmkEaWyfl/bB7bj4TOCxpMvnU0FeYH0xi1yHHFeNyMQzEq3B8pt9PdbxYlsP+AVHsX
         zXxIj8toGFtsAl3b6D+U6sFuzMnsVxLXZkuHmwu1QDIj7cQtGDfaNSuw7LICKI93Slb2
         1V4hZK0pvOEdiFrdO+q/wpMSprjelHqWpn73vVo1vSBQdC0Wcrt+r5hLjLtqY6RfA1G2
         Id77ZwhBakWscFnrRJElpoK1NYgXZ0VfETp5oKmtxu5meXSegkcAJXO0rXBiefdUY0kM
         VrmQ==
X-Forwarded-Encrypted: i=1; AL+hErF9KHlm5pIaPwouuyNWTuXoVYv7QwNHYwLsua8BzwZ3wSOvvfjV/5TOEbgA02QMCgSz6Hsm66c=@vger.kernel.org
X-Gm-Message-State: APuU4Z878nZlpy/6bbr0+Cqg3sM6ygbMvCDqjMsQ1CJdAIBbiRfbFEk6
	cTMIUqpNS3Q4Jq5g/YJbpJYvW2EbnH8vdw+706+mR84qIWReyuOTv5aUuW18+8yN7i0MalzBRUU
	sTWY4IMra/0lEY/KJZu9Khuar8ZnJWQA=
X-Gm-Gg: AZFdTZdqZqhPONAcABDixH06tPVENTo458+hjLhZLVudBbK8Um8+HUIXl8FIDxLSHhv
	zfEVKD6zFQjPfoUyidFPIGqBESxL3AvedVvCbRpK0lACS3KkyUD7N36nHs5ZfheOgjDZpOxGuL9
	xrRqQcPgwuWs9t/C+B1vlFQ+TxLTyyR8bhFff1FTu50qF8cZDyOkkGHAcw+Vjaaiar9Ih+aoiih
	hOvUtIBhoL2S9TDO9XeP6+MnnRcri0cUMp0vKCLbu8yd156h6zv9xX+sDVKBjBvBWmWRAOsIKaV
	p9v20+86HukATkAx2TnI7Pgvu8YoqRgf1Oocg4peF93JMX4gfV117nh63VZjf8/xNCBstdfMh0G
	aNmEn4FUlQfBLepdzx4BqICcy1mSuqsLLQxJhwYs=
X-Received: by 2002:a17:90b:3d90:b0:3ab:b39f:41b9 with SMTP id
 98e67ed59e1d1-3b41cb42c13mr8755285a91.61.1795423968911; Mon, 23 Nov 2026
 00:52:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
 <20261119165340.1071525-2-magnus.karlsson@intel.com> <awCA3XH25M-fZCeK@devvm16445.scu0.facebook.com>
In-Reply-To: <awCA3XH25M-fZCeK@devvm16445.scu0.facebook.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 23 Nov 2026 09:52:36 +0100
X-Gm-Features: Aa3M54oxgzrGjZaIQauDL0BEe3Y2-VsYMMfEBMJ5bsZqtoaJcjSDlqukraajdPI
Message-ID: <CAJ8uoz3xRjbPOHYYs=NZ5QucS6Di+USR_TxLES8qwMxfa4y=TQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] xsk: add USO support for skb path
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org, 
	maciej.fijalkowski@intel.com, sdf@fomichev.me, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	bjorn@kernel.org, kerneljasonxing@gmail.com, intel-wired-lan@lists.osuosl.org, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	jacob.e.keller@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 18:23, Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>
> On 11/19, Magnus Karlsson wrote:
> > Add UDP Segmentation Offload (USO) to the AF_XDP Tx metadata interface
> > and implement it for copy mode. An application submits one Ethernet
> > frame holding a single IP and UDP header followed by the aggregate UDP
> > payload, and the device emits a train of MTU-sized UDP datagrams.
> >
> > The uAPI adds the XDP_TXMD_FLAGS_USO flag and splits the reserved u32
> > in the request part of struct xsk_tx_metadata into two u16 fields:
> > gso_size, the UDP payload bytes per output datagram, and
> > network_offset, the IP header offset. USO requires
> > XDP_TXMD_FLAGS_CHECKSUM, with csum_start pointing at the UDP header,
> > csum_offset at its checksum field and the checksum field seeded with
> > the partial pseudoheader checksum of the aggregate packet. It cannot
> > be combined with XDP_TXMD_FLAGS_TIMESTAMP or
> > XDP_UMEM_TX_SW_CSUM. Launch time is supported and applies to the start
> > of the segmented packet.
> >
> > The request is turned into a GSO skb of type SKB_GSO_UDP_L4. Before
> > transmission, the headers are validated. The link layer is not parsed:
> > the IP header starts at network_offset and its version selects
> > unfragmented IPv4 or IPv6 without extension headers, followed by UDP.
> > The IP and UDP lengths must describe the aggregate packet, every output
> > datagram must fit the MTU, and the number of segments is limited to
> > UDP_MAX_SEGMENTS. As skb drivers find L3 through the EtherType, the skb
> > path also requires the EtherType, after any VLAN tags, to lead to the
> > same IP header. A request that fits in one datagram is sent as an
> > ordinary checksum offload request.
> >
> > network_offset is part of the uAPI because csum_start only locates L4,
> > while segmentation also needs the start of L3: the device rewrites the
> > IP header of every datagram and needs the L2 and L3 lengths, and on
> > the skb path it becomes the network header. With it, the kernel does
> > not need to understand the link layer, and the fields can be reused
> > later. Any future tunnel segmentation extension to the uAPI could then
> > treat network_offset as the outer L3 offset and csum_start as the
> > inner L4 offset, adding only the outer L4 and inner L3 offsets.
> >
> > AF_XDP never segments these packets itself. A request that produces more
> > than one datagram is rejected unless the bound device advertises
> > NETIF_F_GSO_UDP_L4, and the GSO skb is passed to its driver unsegmented.
> > As with UDP_SEGMENT sockets, how the segmentation is carried out is up
> > to the driver. Stacked devices such as VLAN or bonding forward the
> > packet to a lower device that may segment it in software.
> >
> > A new pool field, tx_uso_supported, records whether USO requests are
> > accepted on a pool. It is set only for Ethernet devices (ARPHRD_ETHER)
> > and is cleared when XDP_UMEM_TX_SW_CSUM is used.
> >
> > A USO request that fails validation is dropped: its buffers are
> > completed and counted in tx_invalid_descs. Errors in other Tx metadata
> > keep failing sendmsg() and leave the descriptor on the Tx ring, so the
> > existing behaviour for non-USO requests is unchanged. A USO request
> > that cannot be processed for lack of memory is also left on the Tx
> > ring, and sendmsg() fails with -EAGAIN, unless part of it was already
> > released to user space, either by an earlier call or while peeking
> > further descriptors. That part may already have been reused, so the
> > request is then dropped.
> >
> > The header validator works on a raw header copy instead of an skb, so
> > that the zero-copy path in a later patch can reuse it. It lives in
> > the new files net/xdp/xsk_tx_uso.c and include/net/xsk_tx_uso.h.
> >
> > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > ---
> >  Documentation/networking/xsk-tx-metadata.rst |  91 +++++++++++++
> >  MAINTAINERS                                  |   1 +
> >  include/net/xdp_sock_drv.h                   |  12 ++
> >  include/net/xsk_buff_pool.h                  |   4 +
> >  include/net/xsk_tx_uso.h                     |  30 +++++
> >  include/uapi/linux/if_xdp.h                  |  13 +-
> >  net/xdp/Makefile                             |   1 +
> >  net/xdp/xsk.c                                | 130 +++++++++++++++++--
> >  net/xdp/xsk_buff_pool.c                      |   4 +
> >  net/xdp/xsk_queue.h                          |   6 +
> >  net/xdp/xsk_tx_uso.c                         |  77 +++++++++++
> >  tools/include/uapi/linux/if_xdp.h            |  13 +-
> >  12 files changed, 371 insertions(+), 11 deletions(-)
> >  create mode 100644 include/net/xsk_tx_uso.h
> >  create mode 100644 net/xdp/xsk_tx_uso.c
> >
> > diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
> > index ac15e5fddc6b..41cfc5482b15 100644
> > --- a/Documentation/networking/xsk-tx-metadata.rst
> > +++ b/Documentation/networking/xsk-tx-metadata.rst
> > @@ -55,6 +55,9 @@ The flags field enables the particular offload:
> >    packet for transmission at a pre-determined time called launch time. The
> >    value of launch time is indicated by ``request.launch_time`` field of
> >    ``struct xsk_tx_metadata``.
> > +- ``XDP_TXMD_FLAGS_USO``: requests UDP segmentation offload.
> > +  ``request.gso_size`` specifies UDP payload bytes per output datagram;
> > +  ``request.network_offset`` identifies the IP header.
> >
> >  Besides the flags above, in order to trigger the offloads, the first
> >  packet's ``struct xdp_desc`` descriptor should set ``XDP_TX_METADATA``
> > @@ -70,6 +73,69 @@ In this case, when running in ``XDP_COPY`` mode, the TX checksum
> >  is calculated on the CPU. Do not enable this option in production because
> >  it will negatively affect performance.
> >
> > +UDP Segmentation
> > +================
> > +
> > +To request UDP segmentation offload (USO), bind the socket in
> > +``XDP_COPY`` mode and set ``XDP_TXMD_FLAGS_USO | XDP_TXMD_FLAGS_CHECKSUM``
> > +in the Tx metadata. Reserve at least 16 bytes of metadata and set
> > +``XDP_TX_METADATA`` on the first descriptor of the packet.
> > +
> > +Submit an Ethernet frame containing one IP header, one UDP header, and the
> > +aggregate UDP payload. Set ``request.network_offset`` to the IP header
> > +offset, ``request.csum_start`` to the UDP header offset, and
> > +``request.csum_offset`` to the UDP checksum field offset (6 bytes).
> > +Header offsets are measured from the first descriptor's packet-data address,
> > +excluding metadata. Set ``request.gso_size`` to the number of UDP payload
> > +bytes per output datagram, excluding headers; the last datagram may be
> > +shorter.
> > +
> > +USO is only available on Ethernet devices. ``request.network_offset``
> > +locates the IP header, and its version selects IPv4 or IPv6. In copy mode,
> > +the EtherType, after up to six VLAN tags, must lead to the same IP header,
> > +since drivers rely on it. IPv4 headers may carry options but must not be
> > +fragmented. In IPv6, the UDP header must directly follow the fixed header;
> > +extension headers are not supported.
> > +
> > +The IP and UDP lengths must describe the aggregate packet. Initialize the
> > +UDP checksum field with the partial pseudoheader checksum seed for that
> > +packet. The device generates the per-datagram lengths and UDP checksums and,
> > +for IPv4 segmentation, the IP header checksums. Supply a valid IPv4 header
> > +checksum as well, since a request that fits in one datagram uses ordinary
> > +checksum offload without segmentation.
> > +
> > +All headers through UDP must be in the first buffer. Multi-buffer packets
> > +use ``XDP_USE_SG`` and ``XDP_PKT_CONTD``, with metadata only on the first
> > +descriptor. Each output IP packet must fit the device MTU, and requests
> > +remain subject to the device's segmentation limits. Query
> > +``tx-udp-segmentation`` through ethtool to check whether skb UDP segmentation
> > +offload is enabled.
> > +
> > +AF_XDP never segments the packet itself. In copy mode, a request that
> > +produces more than one datagram is rejected unless the bound device
> > +advertises UDP segmentation offload, and the packet is passed to its driver
> > +unsegmented. A request that fits in one datagram does not need the offload,
> > +so its success does not show that the device supports USO. As with
> > +``UDP_SEGMENT`` sockets, how the segmentation is carried out is up to the
> > +driver, which may build the per-datagram headers in software. Stacked
> > +devices such as VLAN, bonding, or macvlan advertise UDP segmentation
> > +regardless of the lower device and forward the packet through the lower
> > +device's qdisc, where it is segmented in software if the lower device lacks
> > +the offload.
> > +
> > +A USO request that is rejected is dropped: its buffers are returned
> > +through the completion ring and counted in the socket's ``tx_invalid_descs``
> > +statistic. This is the only indication of the failure, whatever its cause:
> > +invalid metadata or headers, the MTU, segmentation limits, or a device
> > +without the offload. A request that cannot be processed for lack of memory
> > +is instead left on the Tx ring, and ``sendmsg()`` fails with ``EAGAIN``,
> > +unless part of a multi-buffer request was already released to user space;
> > +it is then dropped. Errors in other Tx metadata also fail ``sendmsg()`` and
> > +leave the descriptor on the Tx ring.
> > +
> > +USO cannot be combined with ``XDP_UMEM_TX_SW_CSUM`` or
> > +``XDP_TXMD_FLAGS_TIMESTAMP``.
> > +
> >  Launch Time
> >  ===========
> >
> > @@ -127,6 +193,31 @@ cycle time is set to 1 second, the horizon of the launch time ranges
> >  from 1 second to 2 seconds, depending on where the Qbv cycle is currently
> >  running.
> >
> > +USO with launch time
> > +====================
> > +
> > +Add ``XDP_TXMD_FLAGS_LAUNCH_TIME`` to the USO and checksum flags and set
> > +``request.launch_time`` to schedule the segmented packet. This combination
> > +requires at least 24 bytes of Tx metadata.
> > +
> > +The launch time applies to the start of the segmented packet: the first
> > +output UDP datagram is scheduled, and subsequent datagrams follow according
> > +to the device's scheduling rules. This does not request per-datagram pacing
> > +or separate launch times.
> > +
> > +The skb path passes one unsegmented GSO skb and its launch time directly to
> > +the bound device's driver, bypassing that device's qdisc, including ETF.
> > +On stacked devices, the lower device's qdisc and software segmentation
> > +may still apply, as described above. The driver and selected queue
> > +must support UDP segmentation and launch time together. Separate support
> > +for either offload does not establish support for their combination.
> > +As with ordinary launch-time requests, drivers may ignore the time when
> > +scheduling is disabled or unsupported. Acceptance or Tx completion alone
> > +does not prove that a packet was transmitted at the requested time.
> > +
> > +The clock, queue configuration, and scheduling horizon requirements above
> > +also apply to USO launch-time requests.
> > +
> >  Querying Device Capabilities
> >  ============================
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 40bb77cbc6b0..9b5f6f307d53 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -30588,6 +30588,7 @@ F:    Documentation/networking/af_xdp.rst
> >  F:   include/net/netns/xdp.h
> >  F:   include/net/xdp_sock*
> >  F:   include/net/xsk_buff_pool.h
> > +F:   include/net/xsk_tx_uso.h
> >  F:   include/uapi/linux/if_xdp.h
> >  F:   include/uapi/linux/xdp_diag.h
> >  F:   net/xdp/
> > diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
> > index a40ad3f90f13..6b5bb7b29f87 100644
> > --- a/include/net/xdp_sock_drv.h
> > +++ b/include/net/xdp_sock_drv.h
> > @@ -263,6 +263,7 @@ xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr, u32 options)
> >               XDP_TXMD_FLAGS_TIMESTAMP | \
> >               XDP_TXMD_FLAGS_CHECKSUM | \
> >               XDP_TXMD_FLAGS_LAUNCH_TIME | \
> > +             XDP_TXMD_FLAGS_USO | \
> >       0)
> >
> >  static inline bool
> > @@ -270,6 +271,10 @@ xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
> >                          const struct xsk_tx_metadata *meta, u64 *flags)
> >  {
> >       *flags = READ_ONCE(meta->flags);
> > +     if (*flags & XDP_TXMD_FLAGS_USO)
> > +             if (!pool->tx_uso_supported || pool->tx_metadata_len <
> > +                 offsetofend(struct xsk_tx_metadata, request.network_offset))
> > +                     return false;
> >       if (*flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
> >               if (pool->tx_metadata_len <
> >                   offsetofend(struct xsk_tx_metadata, request.launch_time))
> > @@ -277,6 +282,13 @@ xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
> >       return !(*flags & ~XDP_TXMD_FLAGS_VALID);
> >  }
> >
> > +/* USO requires checksum offload and cannot report a Tx timestamp. */
> > +static inline bool xsk_tx_uso_flags_valid(u64 flags)
> > +{
> > +     return (flags & XDP_TXMD_FLAGS_CHECKSUM) &&
> > +            !(flags & XDP_TXMD_FLAGS_TIMESTAMP);
> > +}
> > +
> >  /**
> >   *  xsk_tx_metadata_request - Evaluate AF_XDP TX metadata at submission
> >   *  and call appropriate xsk_tx_metadata_ops operation.
> > diff --git a/include/net/xsk_buff_pool.h b/include/net/xsk_buff_pool.h
> > index 02e89350faf9..ea2ff3680efa 100644
> > --- a/include/net/xsk_buff_pool.h
> > +++ b/include/net/xsk_buff_pool.h
> > @@ -89,6 +89,10 @@ struct xsk_buff_pool {
> >       bool uses_need_wakeup;
> >       bool unaligned;
> >       bool tx_sw_csum;
> > +     /* USO requests accepted: Ethernet device without SW checksum, and
> > +      * driver support in zero-copy mode. Set when the pool is bound.
> > +      */
> > +     bool tx_uso_supported;
> >       void *addrs;
> >       /* Mutual exclusion of the completion ring in the SKB mode.
> >        * Protect: NAPI TX thread and sendmsg error paths in the SKB
> > diff --git a/include/net/xsk_tx_uso.h b/include/net/xsk_tx_uso.h
> > new file mode 100644
> > index 000000000000..f23384077712
> > --- /dev/null
> > +++ b/include/net/xsk_tx_uso.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _NET_XSK_TX_USO_H
> > +#define _NET_XSK_TX_USO_H
> > +
> > +#include <linux/errno.h>
> > +#include <linux/types.h>
> > +#include <net/xsk_buff_pool.h>
> > +
> > +/* Header offsets are relative to the start of the supplied Ethernet frame. */
> > +struct xsk_tx_uso_info {
> > +     struct xsk_tx_metadata metadata;
> > +     u32 len;
> > +     u16 header_len;
> > +     u16 gso_segs;
> > +     __be16 protocol;
> > +     u8 l4_protocol;
> > +};
> > +
> > +#ifdef CONFIG_XDP_SOCKETS
> > +int xsk_tx_uso_validate(const void *header, struct xsk_tx_uso_info *uso,
> > +                     u32 mtu);
> > +#else
> > +static inline int
> > +xsk_tx_uso_validate(const void *header, struct xsk_tx_uso_info *uso, u32 mtu)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> > +#endif
> > diff --git a/include/uapi/linux/if_xdp.h b/include/uapi/linux/if_xdp.h
> > index 50d67df78911..0f7ba4859218 100644
> > --- a/include/uapi/linux/if_xdp.h
> > +++ b/include/uapi/linux/if_xdp.h
> > @@ -134,6 +134,12 @@ struct xdp_options {
> >   */
> >  #define XDP_TXMD_FLAGS_LAUNCH_TIME           (1 << 2)
> >
> > +/* Request UDP segmentation offload in XDP_COPY mode. Requires CHECKSUM.
> > + * Segment size and IP header offset are in request.
> > + * With LAUNCH_TIME, scheduling applies to the start of the segmented packet.
> > + */
> > +#define XDP_TXMD_FLAGS_USO                   (1 << 3)
> > +
> >  /* AF_XDP offloads request. 'request' union member is consumed by the driver
> >   * when the packet is being transmitted. 'completion' union member is
> >   * filled by the driver when the transmit completion arrives.
> > @@ -149,7 +155,12 @@ struct xsk_tx_metadata {
> >                       __u16 csum_start;
> >                       /* Offset from csum_start where checksum should be stored. */
> >                       __u16 csum_offset;
> > -                     __u32 reserved;
> > +
> > +                     /* XDP_TXMD_FLAGS_USO */
> > +                     /* UDP payload bytes per output datagram. */
> > +                     __u16 gso_size;
> > +                     /* IP header offset from desc->addr. */
> > +                     __u16 network_offset;
>
> It is only a matter of time now until someone asks for TSO. I remember
> there was strong opposition awhile ago, not sure the winds have changed..
> So maybe we should at least make it more generic on the UAPI side
> to keep the conversion open? Make it xSO, support passing protocol,
> support only UDP for now.. And maybe gso_size is something we can
> also rename? segment_size?

Good idea. I do not think it will hurt to be future proof in this
case, even if TSO support never materializes.

> >
> >                       /* XDP_TXMD_FLAGS_LAUNCH_TIME */
> >                       /* Launch time in nanosecond against the PTP HW Clock */
> > diff --git a/net/xdp/Makefile b/net/xdp/Makefile
> > index 30cdc4315f42..b6109e0e5547 100644
> > --- a/net/xdp/Makefile
> > +++ b/net/xdp/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_XDP_SOCKETS) += xsk.o xdp_umem.o xsk_queue.o xskmap.o
> >  obj-$(CONFIG_XDP_SOCKETS) += xsk_buff_pool.o
> > +obj-$(CONFIG_XDP_SOCKETS) += xsk_tx_uso.o
> >  obj-$(CONFIG_XDP_SOCKETS_DIAG) += xsk_diag.o
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index f22f9a2cdbbe..14be62b8de5f 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -11,6 +11,8 @@
> >
> >  #define pr_fmt(fmt) "AF_XDP: %s: " fmt, __func__
> >
> > +#include <linux/if_arp.h>
> > +#include <linux/if_vlan.h>
> >  #include <linux/if_xdp.h>
> >  #include <linux/init.h>
> >  #include <linux/sched/mm.h>
> > @@ -22,6 +24,7 @@
> >  #include <linux/net.h>
> >  #include <linux/netdevice.h>
> >  #include <linux/rculist.h>
> > +#include <linux/udp.h>
> >  #include <linux/uio.h>
> >  #include <linux/vmalloc.h>
> >
> > @@ -31,6 +34,7 @@
> >  #include <net/netdev_lock.h>
> >  #include <net/netdev_rx_queue.h>
> >  #include <net/xdp.h>
> > +#include <net/xsk_tx_uso.h>
> >
> >  #include "../core/dev.h"
> >
> > @@ -986,12 +990,62 @@ static void xsk_drop_skb(struct sk_buff *skb)
> >       xs->skb = NULL;
> >  }
> >
> > +static int xsk_skb_uso(struct sk_buff *skb)
> > +{
> > +     struct xsk_tx_uso_info uso = {
> > +             .metadata.request = {
> > +                     .gso_size = skb_shinfo(skb)->gso_size,
> > +                     .csum_start = skb_transport_offset(skb),
> > +                     .network_offset = skb_network_offset(skb),
> > +             },
> > +             .header_len = skb_transport_offset(skb) + sizeof(struct udphdr),
> > +             .len = skb->len,
> > +     };
> > +     int depth, err;
> > +
> > +     /* Best effort: a bond or team device can change type while the pool
> > +      * is bound, also after this check.
> > +      */
> > +     if (READ_ONCE(skb->dev->type) != ARPHRD_ETHER)
> > +             return -EINVAL;
> > +     if (!pskb_may_pull(skb, uso.header_len))
> > +             return -ENOMEM;
> > +
> > +     err = xsk_tx_uso_validate(skb->data, &uso, READ_ONCE(skb->dev->mtu));
> > +     if (err)
> > +             return err;
> > +
> > +     skb_reset_mac_header(skb);
> > +     skb->protocol = eth_hdr(skb)->h_proto;
> > +     /* skb drivers find L3 through the EtherType and VLAN tags. Parse them
> > +      * from the end of the Ethernet header, not from network_offset.
> > +      */
> > +     skb->mac_len = ETH_HLEN;
> > +     if (__vlan_get_protocol(skb, skb->protocol, &depth) != uso.protocol ||
> > +         depth != skb_network_offset(skb))
> > +             return -EINVAL;
> > +     skb_reset_mac_len(skb);
> > +     if (uso.gso_segs == 1) {
> > +             skb_gso_reset(skb);
> > +             return 0;
> > +     }
> > +
> > +     skb_shinfo(skb)->gso_segs = uso.gso_segs;
> > +     if (netif_needs_gso(skb, netif_skb_features(skb)))
> > +             return -EOPNOTSUPP;
> > +
> > +     return 0;
> > +}
> > +
> > +/* A failed USO request returns -EOVERFLOW, so that the packet is dropped. Other
> > + * metadata errors are returned to user space.
> > + */
> >  static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
> >                           struct xdp_desc *desc, struct xsk_buff_pool *pool,
> >                           u32 hr)
> >  {
> >       struct xsk_tx_metadata *meta = NULL;
> > -     u16 csum_start, csum_offset;
> > +     int err = -EINVAL;
> >       u64 flags;
> >
> >       if (unlikely(pool->tx_metadata_len == 0))
> > @@ -999,18 +1053,43 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
> >
> >       meta = buffer - pool->tx_metadata_len;
> >       if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
> > -             return -EINVAL;
> > +             goto err;
> > +
> > +     if (flags & XDP_TXMD_FLAGS_USO) {
> > +             u16 nhoff = READ_ONCE(meta->request.network_offset);
> > +             u16 offset = READ_ONCE(meta->request.csum_offset);
> > +             u16 thoff = READ_ONCE(meta->request.csum_start);
> > +             u16 size = READ_ONCE(meta->request.gso_size);
> > +
> > +             if (!xsk_tx_uso_flags_valid(flags))
> > +                     goto err;
> > +             if (!size || size == GSO_BY_FRAGS ||
> > +                 nhoff < ETH_HLEN || thoff < nhoff ||
> > +                 thoff + sizeof(struct udphdr) > desc->len ||
> > +                 offset != offsetof(struct udphdr, check) ||
> > +                 hr + thoff >= U16_MAX)
> > +                     goto err;
> > +
> > +             skb_set_network_header(skb, nhoff);
> > +             skb_set_transport_header(skb, thoff);
> > +             skb_shinfo(skb)->gso_size = size;
> > +             skb_shinfo(skb)->gso_type = SKB_GSO_UDP_L4;
> > +     }
> >
> >       if (flags & XDP_TXMD_FLAGS_CHECKSUM) {
> > -             csum_start = READ_ONCE(meta->request.csum_start);
> > -             csum_offset = READ_ONCE(meta->request.csum_offset);
> > +             if (flags & XDP_TXMD_FLAGS_USO) {
>
> [..]
>
> > +                     skb->csum_start = skb_transport_offset(skb);
> > +                     skb->csum_offset = offsetof(struct udphdr, check);
>
> Why do we want this? Can we assume the user will do the right thing
> if they set XDP_TXMD_FLAGS_CHECKSUM?

This is to avoid reading these variables twice from user-space. They
might have changed in-between by some malicious user. The read from
user-space can be found in the if-statement above this that is only
executed for USO.
