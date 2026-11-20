Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163721;
	b=4WkTI7F6yffcwMrko5BO7NbaetL8MYFLxrtJuA4/RNcmjfzqog+p6ZaSFJ4pz+QmvbLT
	 BDgdjn2QaxZd3XEkg2kwyy/6+Z3vcDE6BLglWt8cX8Cb0yVJAzidOMIrdBkNF7LMC59YV
	 UduSDPAlT0v37Ugsf9jvByEQ+WIMBAsb6yJ+0GBuCWHVqb5y8yFtiPYv4+wySUIi8dFHQ
	 jEjhq3rPxuebRqm/aICzKSXxYFA2wtbYL1KOkh6glqCJHFOoMaq0Hy0H3/pg1p+dKXLu7
	 PzOCwyBc2MvmNoAFJb4hBfNsNs2Lc/7bwA6zUTQUCuYj1ttpSVSbZcHEI4pySsEq3Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cGln8FVjtHumSWCLAXROuRIIllin/ovk1fH3wXcljBI=;
	b=dwvLnpPFbmUjzLAyHw65xXNxkjE8iU0PI2/jDMyoyB83ud8Z3OIrYFFVvc/0ji0zFcP8
	 WUpEexhZIFcojv575t/PUYrriBW35++E0a0+A3Dv2NX9MPBNHRH419zmiiGeEBh9EEg9g
	 8dLeZARzB5Vn5cLarq8jyATpLNWC0R3Le37OZ9G0UP6PZNHJ6jjtqrdHyVRPRdcP1rB0c
	 ImleR82ysRPNWNe1DGrFZi1ToMEttseskupzE2+6sXJ4cP6AjXlLEsysRH9Nym2qVdEpv
	 DILVbNelpfo+DYcE9NVwoW6TCf65feqwmNHAKJ/SoyeXynF8jV9iFI3j7QVWYRHakUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wy6Z7ILg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9B606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE9B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wy6Z7ILg
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04f61282dso280915ad.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163720; cv=none;
        d=google.com; s=arc-20260327;
        b=g4ehJSWz2nENzWMwAsbIeW8S5/29whfggYnUJR2TsrZZGdxsktvPgQI5PAJpLvha0b
         uJgoLN6X0Jh3njawwv9u3ldyB4A7OVIe6E9wgG6WDlJV9+tVv59faw/DUHJaFWXOnd+1
         k7kOICCY2wfCu/wRCT5BD8rxDtD7JGsavHkTAbd66bNY0r4/typK7+8RN46lLDwVz0fq
         Nu6nMbuLbXt2RrhUU/9zaVs81q18d5/8OiRxnM7iNBX3DKfOzLBch/f2AGwQWHHLzDf/
         9V350qx/vMZ1Q1LRL/CqeI+RUAmET004I/kR2P3cU9VRiyRIcJ/eoWWpr4fz/tRM6eGC
         bOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cGln8FVjtHumSWCLAXROuRIIllin/ovk1fH3wXcljBI=;
        fh=8ZX6UjX6UqYxNU487ayzACsXgkfI/nIU5u1WnbrkJmU=;
        b=au2i0gIaFVoG57VlIorT3StorHFuxokYsamk8U7BFIGz2yJ9sLCX1DuGY+mW3YU8iS
         U3uBYnqwTI/mYuEqgfS6YwM8Za6O4rzWyrVXk1vHv+G5FJ3HWD3Yrg52fXqwzljbdHD1
         WwARCmGzb2z28t/WN/bY18fJrFO+Ct3BRoyTcgrQEHwIyHY7ARqp6jvThaAPVW181pN/
         dPAT9Xvr6qDipvSJHqd1i6CcHkRp0YZia1HgO2cG2/OPUJBoTwCxm2CFe8zLUOBJNmRP
         uLEjwLS5SEU6s8brgYE1sBPqQdWAElIOThgkR+TPZpIRAolPC36QM5xZlWnEGmcwgThh
         ftkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163720; x=1795768520; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGln8FVjtHumSWCLAXROuRIIllin/ovk1fH3wXcljBI=;
        b=Wy6Z7ILgOLM2fUZXsbr3x0WQLIBU6wqEujOcxj1NG50vFoGWDBe1eMaFnv8Ik4B7nc
         jlooG2p2jfpy3NjrkYB5JZPCZmvWstYOue1dL8fdI6otQVRsBtZD3bVCVGig0TM1Z7ET
         YKTXHcn94TCnPkMq+BL97VyAIJ8mZ5jBwzjbvGbIBipgDWeMczKWsA2hxcUqZgemIWE9
         MQtHy8PXbhe9OAqysauHn/J7kDE6eOksZdddISNs8nKbA3fOZj2YCaWOIesl3nkJnQHi
         3qKFfjBrmUBBz+XGPlbL/oLoGlaWSkzOwWuPULdr0RJ3PitUYx5pbpJ8b+VdRMpGTsRY
         dZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163720; x=1795768520;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cGln8FVjtHumSWCLAXROuRIIllin/ovk1fH3wXcljBI=;
        b=DpwZ721XMD4pkpdis3b9Q2PS2JI178A6w/wjCMlOqMkkc2pKxkdUP59XBdlMwfoPba
         sTSHQRW0TZ+yo3ex3XJ5H1G/JGBTkodq+W+LKkc9JBmCatdIuGZYUwfa6pmm4+NaAlrI
         MVNFcuE2m5beTg2V+NkproG+qurIt0FkdmgjALTW+NQMBHnuYKLmUreqJ0RgpNBRTzz9
         P2W2O5L9wLnC8AYBGUebeEgnXaSobrgMqfL2fDZ515QXMhC9BHWcPN/FZ5B6zjUnVvIL
         XWVSAqZsTXGS95A+H6PL7nxFfC089XYFt+Uuf3ssxRiPmEvWfl06T8eif4AUWIfU4lMA
         6abg==
X-Forwarded-Encrypted: i=1; AL+hErGGoV979QN4M/rLJCW0aPZyeh+gnPA+UTYH5l3Ba0XOTRjwhrPIrzYtRLGTTGwId3+kZCKXQSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AHOXDBBrdIpt7LVExlqXaUTbaOB1nYlL1Ob2WX6xgaZau3KC8
	ZTcmgLeOpggXbXrqpecJ9ZkD2LueuvtRzbJQymJwqyHM5kFo2PfjS2QXLmvm7NHVsnD4qCf9Mkg
	kFBiGxAen1ZNUAX0LouVI15ftJB3jjRY=
X-Gm-Gg: AZFdTZcmUhwhPFEwqHzgWnAy8hOL53RRCsMnMi+J4YSOGgWTi7w8IXGiJO4Mk8RC5nD
	tDeThskkwPT/XyxfUyoohoIc+8ddYthVrQVcBVCgKuBswC1gFsBZTdj2ZTDOBU/dmHdpiGqnp0M
	pnBvu4MJCieGX7DTzHcmNoxh1+NMJy/MfzFP7He89QksV5fNq8Bt10chwrIdHX3tITacIaMxf+e
	WKNzCf52hNyN/BigY7anWWV8feYAA2Zr1fUUYXfIJwIALsZWT8bv+SRQKdfzZKx2hVyxfZXKjT5
	pNJ7jATMGJPDU/ODymA22eEQ7FFnDh4Xm/hNWASgu83mTDDOgJFltuH1jQC54P3daqdNJ92C0Ui
	uMw4kVJCfwKeEwMEiypt7c8C9UyE2kN4bYFVnIp8=
X-Received: by 2002:a17:902:ef45:b0:2ef:d7ed:80dc with SMTP id
 d9443c01a7336-2f03f1e0d55mr25140855ad.49.1795163720037; Fri, 20 Nov 2026
 00:35:20 -0800 (PST)
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
 <20261119165340.1071525-6-magnus.karlsson@intel.com> <av9Ia2gpMyF9jTuE@boxer>
In-Reply-To: <av9Ia2gpMyF9jTuE@boxer>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Fri, 20 Nov 2026 09:35:05 +0100
X-Gm-Features: AclHuK_6RZLdCqEfKboKrqBzIVM-urAOCv16V7vZrfePzBVVCw2zR12hPxAdyU4
Message-ID: <CAJ8uoz0cv7j7=nHt6ikw4JnJOHA0NTstjN1iKYswGjH8jeWBZw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] selftests: net: add AF_XDP USO test
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org, sdf@fomichev.me, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, bjorn@kernel.org, kerneljasonxing@gmail.com, 
	intel-wired-lan@lists.osuosl.org, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, jacob.e.keller@intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 20:05, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Thu, Nov 19, 2026 at 05:53:40PM +0100, Magnus Karlsson wrote:
> > Add xsk_uso, a functional test for AF_XDP UDP segmentation offload in
> > copy and zero-copy mode. It sends USO requests from an AF_XDP socket
> > and checks the datagrams received on a packet socket: the number of
> > datagrams, the IP and UDP lengths, the checksums and the payload, for
> > IPv4 and IPv6, and single and multi-buffer requests. It also checks
> > that invalid requests are dropped and counted in tx_invalid_descs.
> >
> > The test needs root and physical NICs with an MTU of at least 1448,
> > either two connected ports (-i TX_IFACE -r RX_IFACE) or one in NIC
> > loopback (-l -i IFACE). Virtual devices such as veth pass the packet on
> > without segmenting it. Zero copy (-z) also needs a native XDP program on
> > the interface. Standalone checksum offload cases run only with -C, as
> > they test the existing checksum offload rather than USO. As it needs
> > real hardware, it is built but not run by default, like xdp_hw_metadata.
> > It uses the AF_XDP library in net/lib/xsk.
>
> I assume the end goal for xdp_hw_metadata is to pull in its contents onto
> xsk python runner. What is the case for this one?

It should be merged into the python runner that you are working on.
But I need that to land first before I can move this. You could say
that this patch is just temporary until your stuff has landed.

> Also since you're adding support to copy mode i assume veth runs would be
> welcome...

While veth accepts USO, it will never segment the packet. The skb will
just be delivered to the other side as is, so we need real HW for
these tests.

> Did you try to point AI to my set and ask whether it would be able to
> produce python runner for that? Or do we don't want to have this CI'ed ?

I am sure that is possible, but I will spend those tokens once your
move has landed. We definitely want this to be in the CI and
integrated with your stuff.

> >
> > Missing prerequisites are reported as skips. In zero-copy mode, the
> > device must report xsk-zerocopy and tx-uso-zc, and checksum-only cases
> > need tx-checksum. In both modes, cases that produce more than one
> > datagram need tx-udp-segmentation, including the invalid ones, which
> > would otherwise be dropped for lack of the offload whatever their
> > headers. Cases that need more descriptors than xdp-zc-max-segs are
> > skipped, and so are binds that the device refuses with EOPNOTSUPP.
> > Receive-side UDP GRO (rx-udp-gro-forwarding, rx-gro-list) must be off,
> > as it would merge the segments again before the packet socket sees them.
> > USO with launch time must succeed in copy mode and be dropped in
> > zero-copy mode.
> >
> > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > ---
> >  tools/testing/selftests/net/.gitignore |   1 +
> >  tools/testing/selftests/net/Makefile   |  10 +-
> >  tools/testing/selftests/net/xsk_uso.c  | 954 +++++++++++++++++++++++++
> >  3 files changed, 964 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/testing/selftests/net/xsk_uso.c
> >
>
> ...
>
> > +
> > +static void get_mac(const char *name, unsigned char *mac)
> > +{
> > +     struct ifreq ifr = {};
> > +     int fd = socket(AF_INET, SOCK_DGRAM, 0);
> > +
> > +     if (fd < 0)
> > +             ksft_exit_fail_msg("socket: %s\n", strerror(errno));
> > +     snprintf(ifr.ifr_name, sizeof(ifr.ifr_name), "%s", name);
> > +     if (ioctl(fd, SIOCGIFHWADDR, &ifr))
> > +             ksft_exit_fail_msg("MAC address for %s: %s\n", name, strerror(errno));
> > +     memcpy(mac, ifr.ifr_hwaddr.sa_data, ETH_ALEN);
> > +     close(fd);
> > +}
> > +
> > +static unsigned int get_mtu(const char *name)
> > +{
> > +     struct ifreq ifr = {};
> > +     int fd = socket(AF_INET, SOCK_DGRAM, 0);
> > +
> > +     snprintf(ifr.ifr_name, sizeof(ifr.ifr_name), "%s", name);
> > +     if (fd < 0 || ioctl(fd, SIOCGIFMTU, &ifr))
> > +             ksft_exit_fail_msg("MTU of %s: %s\n", name, strerror(errno));
> > +     close(fd);
> > +     return ifr.ifr_mtu;
> > +}
>
> this is a lib content which i'm also adding, so we're gonna clash.
>
> > +
> > +/* Virtual devices have no backing device, and pass GSO packets on whole. */
> > +static bool is_physical(const char *name)
> > +{
> > +     char path[64];
> > +
> > +     snprintf(path, sizeof(path), "/sys/class/net/%s/device", name);
> > +     return !access(path, F_OK);
> > +}
> > +
> > +static int ethtool_ioctl(const char *name, void *cmd)
> > +{
> > +     struct ifreq ifr = { .ifr_data = cmd };
> > +     int fd = socket(AF_INET, SOCK_DGRAM, 0), err;
> > +
> > +     if (fd < 0)
> > +             return -1;
> > +     snprintf(ifr.ifr_name, sizeof(ifr.ifr_name), "%s", name);
> > +     err = ioctl(fd, SIOCETHTOOL, &ifr);
> > +     close(fd);
> > +     return err;
> > +}
> > +
> > +/* Returns whether the netdev feature called @feature is active on @name. */
> > +static bool feature_active(const char *name, const char *feature)
> > +{
> > +     struct ethtool_gfeatures *features = NULL;
> > +     struct ethtool_gstrings *strings = NULL;
> > +     struct ethtool_sset_info *sset;
> > +     unsigned int count, blocks, i;
> > +     bool active = false;
> > +
> > +     sset = calloc(1, sizeof(*sset) + sizeof(sset->data[0]));
> > +     if (!sset)
> > +             ksft_exit_fail_msg("calloc: %s\n", strerror(errno));
> > +     sset->cmd = ETHTOOL_GSSET_INFO;
> > +     sset->sset_mask = 1ULL << ETH_SS_FEATURES;
> > +     if (ethtool_ioctl(name, sset))
> > +             ksft_exit_fail_msg("ETHTOOL_GSSET_INFO: %s\n", strerror(errno));
> > +     if (!sset->sset_mask)
> > +             ksft_exit_fail_msg("%s reports no feature strings\n", name);
> > +     count = sset->data[0];
> > +     blocks = (count + 31) / 32;
> > +     strings = calloc(1, sizeof(*strings) + count * ETH_GSTRING_LEN);
> > +     features = calloc(1, sizeof(*features) +
> > +                       blocks * sizeof(features->features[0]));
> > +     if (!strings || !features)
> > +             ksft_exit_fail_msg("calloc: %s\n", strerror(errno));
> > +     strings->cmd = ETHTOOL_GSTRINGS;
> > +     strings->string_set = ETH_SS_FEATURES;
> > +     strings->len = count;
> > +     features->cmd = ETHTOOL_GFEATURES;
> > +     features->size = blocks;
> > +     if (ethtool_ioctl(name, strings) || ethtool_ioctl(name, features))
> > +             ksft_exit_fail_msg("ethtool features: %s\n", strerror(errno));
> > +     for (i = 0; i < count; i++)
> > +             if (!strncmp((char *)strings->data + i * ETH_GSTRING_LEN, feature,
> > +                          ETH_GSTRING_LEN)) {
> > +                     active = features->features[i / 32].active & (1U << (i % 32));
> > +                     break;
> > +             }
> > +     free(features);
> > +     free(strings);
> > +     free(sset);
> > +     return active;
> > +}
> > +
> > +static void get_xdp_features(unsigned int ifindex, uint64_t *xdp, uint64_t *xsk,
> > +                          unsigned int *zc_max_segs)
> > +{
> > +     struct netdev_dev_get_req *req;
> > +     struct netdev_dev_get_rsp *rsp;
> > +     struct ynl_error yerr;
> > +     struct ynl_sock *ys;
> > +
> > +     ys = ynl_sock_create(&ynl_netdev_family, &yerr);
> > +     if (!ys)
> > +             ksft_exit_fail_msg("YNL: %s\n", yerr.msg);
> > +     req = netdev_dev_get_req_alloc();
> > +     if (!req)
> > +             ksft_exit_fail_msg("netdev_dev_get_req_alloc failed\n");
> > +     netdev_dev_get_req_set_ifindex(req, ifindex);
> > +     rsp = netdev_dev_get(ys, req);
> > +     netdev_dev_get_req_free(req);
> > +     if (!rsp)
> > +             ksft_exit_fail_msg("netdev dev-get: %s\n", ys->err.msg);
> > +     *xdp = rsp->_present.xdp_features ? rsp->xdp_features : 0;
> > +     *xsk = rsp->_present.xsk_features ? rsp->xsk_features : 0;
> > +     *zc_max_segs = rsp->_present.xdp_zc_max_segs ? rsp->xdp_zc_max_segs : 1;
> > +     netdev_dev_get_rsp_free(rsp);
> > +     ynl_sock_destroy(ys);
>
> you really should look at python drv-net infra...
