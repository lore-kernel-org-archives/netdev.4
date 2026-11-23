Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459600;
	b=s2mSwmLcKZ8//ZrPtxJ507s2w+9lqbsc4DIJIKTjturZjdSeYxoB/lBpBBlEDX0wNYRO
	 yR7W/qHykzczu8PMvYJiEID6h41vtSZ5QUkbfiP4XiDUABfeFzPqYxdwlzej//Y2D+Hvd
	 zECEv0Aq0FAPi+vILziZq6IXHhnnl7jWpS/4Ga8NS/i588f2+QQHUKPVoTb88W9mleymb
	 yUdx++aIfs7jMXMG79VpcxHUj3fKTqlkRGOxWcvWoizbjgbfWK/X0CSQjIo8SMp2Uqvvz
	 TWdiXp0AsCtrDD60xbNn2ONQIS775w1JF89BujP0Fp3Zx0m2MfVvMzlU6clbsx43Etw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459600;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HEpENts/gFDvQfVLi/YRCCA8fZ9tFdcSg7hBd/Vai+o=;
	b=kKQc9Quu7YuPJ1EjRR+E3qEVPnpv/nifq1YEUU6qdKZppw2fgVzqR2qiIFRn7k0BGmuI
	 6qMtzqsG53+SiJJiWKj/ehz42KnH+Iz+Ayxq7OpaGM2DX2FNfOV7pj74r6hfAe8GZAS9L
	 PBdizF/7SoLUolMpzEQduuSTEP8uRv+wkNAUunrQ2A6q90YdqOpVw3b6af/IhGmt8jbSF
	 2nqzAsRED9qLiMBLAF3Tzsrkt3c2EqD0YK93cV8jNGXCF0R/FCfQm5qV4M0ZOz5Ave44G
	 88XB+mBkOQl4tw9eUCyS4RN+e9QHoiNE7bQGlnyyjj00g3VEpSdL3BgoySxentrg8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaWnM4LW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA5606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaWnM4LW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6611F000C0;
	Mon, 23 Nov 2026 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459599;
	bh=HEpENts/gFDvQfVLi/YRCCA8fZ9tFdcSg7hBd/Vai+o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YaWnM4LWNSvXWUIBBWvX08RR9SqU/y46oLU4SrdWAxrXW0u+C4vR3A5+34qeC/cdj
	 I7e9Dy07Gj8rkTGLXdjg0xAVtlShD/xqFjHF+WtqCFwNB9gf4DrfHtcQHuXitrBnSZ
	 hXwwDgn0sdXb9ZQnAFrXXP8MYY2YJh07ZUmdetdGqwXmzXYloD/vWYRNlGHeq15q0X
	 1UFpOF2hfBj2oF6sUbXObMmFGFzzii2IppZFzO8+4fy0UZ3MKAvcKE/bKKEKvVygIZ
	 MvXX2oReIijVkWIC3TT51DQcVo0stMHGj2jk2OlF1KjaElueTAzukLVySurgOzcnai
	 bTNzDAvQUz8cA==
Subject: Re: [PATCH v5 net-next 08/13] selftests: xsk: send UDP over IPv4 or
 IPv6 between the interface MACs
From: netdev-bot+sashiko@kernel.org
To: maciej.fijalkowski@intel.com
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org
Date: Mon, 23 Nov 2026 18:46:38 +0000
Message-ID: <179545959852.3135.9080788623983347843@kernel.org>
In-Reply-To: <20261119164636.1071385-9-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-9-maciej.fijalkowski@intel.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This commit turns the AF_XDP test frames into UDP over
  IPv4/IPv6.
- [Low] The feature patch also carries fixes for older selftest defects,
  with no Fixes: tag and no separate patch.
- [Low] parse_command_line() in xskxceiver.c reads --udp-port with
  `opt_udp_port = strtoul(optarg, NULL, 10);` into a u16 and checks no…

--

selftests: xsk: send UDP over IPv4 or IPv6 between the interface MACs

The xskxceiver test frames used to be ETH_P_LOOPBACK frames between
made-up MAC addresses. They are now UDP over IPv4 or IPv6 between the
real interface MACs, configured by new --src-ip, --dst-ip, --dst-mac and
--udp-port options. The XDP programs now redirect only UDP packets to the
test port and pass everything else to the stack. The patch also fixes the
.bss read in is_adjust_tail_supported() and adds length checks to
is_frag_valid() and pkt_dump().

> diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
> index fdf449822f026..d4485da0f9ac8 100644
> --- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
> +++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c

[ ... ]

> @@ -792,31 +933,12 @@ static bool is_metadata_correct(struct pkt *pkt, void *buffer, u64 addr)
>  	return true;
>  }
>  
> -static int is_adjust_tail_supported(struct xsk_xdp_progs *skel_rx, bool *supported)
> +static bool is_adjust_tail_supported(struct xsk_xdp_progs *skel_rx)
>  {
> -	struct bpf_map *data_map;
> -	int adjust_value = 0;
> -	int key = 0;
> -	int ret;
> -

[ ... ]

> -	ret = bpf_map_lookup_elem(bpf_map__fd(data_map), &key, &adjust_value);
> -	if (ret) {
> -		ksft_print_msg("Error: bpf_map_lookup_elem failed with error %d\n", ret);
> -		return ret;
> -	}
> -
>  	/* Set the 'adjust_value' variable to -EOPNOTSUPP in the XDP program if the adjust_tail
>  	 * helper is not supported. Skip the adjust_tail test case in this scenario.
>  	 */
> -	*supported = adjust_value != -EOPNOTSUPP;
> -
> -	return 0;
> +	return skel_rx->bss->adjust_value != -EOPNOTSUPP;
>  }

[Severity: Low]
This isn't a bug, but the old bpf_map_lookup_elem() call here was a real
stack overflow in the test process, and it has nothing to do with the
UDP conversion. The baseline .bss holds idx, drop_idx, adjust_value and
count. That is at least 16 bytes, all copied into the single int
adjust_value on the stack.

The same applies to the new short fragment check in is_frag_valid() and
the bounded word count in pkt_dump().

The commit message does describe each fix, and they are tied to this
patch. It removes idx and adds test_port to .bss. It also grows
PKT_HDR_SIZE to 44 or 64 bytes, which is why the short fragment check is
needed. The fixes themselves look complete.

Would it be worth moving these into a separate patch with a Fixes: tag,
so they can be picked up on their own?

[ ... ]

> diff --git a/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c b/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c
> index 84e5f47322895..2b55dbaf13b24 100644
> --- a/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c
> +++ b/tools/testing/selftests/net/lib/xsk/xsk_xdp_progs.bpf.c

[ ... ]

> +static __always_inline bool is_test_packet(struct xdp_md *xdp)
> +{
> +	__u32 hdr_len;
> +
> +	return test_udp_hdr(xdp, &hdr_len);
> +}
>  
>  SEC("xdp.frags") int xsk_def_prog(struct xdp_md *xdp)
>  {
> +	if (!is_test_packet(xdp))
> +		return XDP_PASS;
>  	return bpf_redirect_map(&xsk, 0, XDP_DROP);
>  }

[Severity: Medium]
The test frames now carry real IPv4/IPv6 and UDP headers, so NIC RSS can
hash them. The old ETH_P_LOOPBACK frames gave it nothing to hash. Every
program here still redirects to a fixed xskmap index, whatever
xdp->rx_queue_index is:

    return bpf_redirect_map(&xsk, 0, XDP_DROP);

On a multi-queue physical NIC with no flow steering, what happens to a
test packet that RSS puts on a queue other than the bound one? It looks
like xsk_rcv_check() would drop it, and the case would then time out.

XDP_SHARED_UMEM makes this more likely. Each socket now sends from its
own source port, set in __test_spec_init():

    xsk->src_port = udp_port + j;

So an L4 hash could put the two flows on different queues.

Later in the series, "selftests: drv-net: run the AF_XDP tests over veth
or a NIC" handles this in drivers/net/xsk.py. _reserve_queue() takes the
bound queue out of RSS with ethtool -X equal. _steer_udp() then installs
an ethtool -N flow-type udp4/udp6 dst-port rule on both hosts. The rule
matches only the destination port, so it covers both shared UMEM source
ports. "selftests: xsk: drop the single-interface loopback mode" also
says the hardware test steers its traffic with ntuple and RSS
configuration. At this commit, no in-tree runner drives a physical NIC.

Could the usage text or the commit message say that the caller has to
steer the flow to the bound queue?

[ ... ]

> diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> index ded94b84cd1da..ef03bf3bd37b1 100644
> --- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> +++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c

[ ... ]

> @@ -294,6 +315,20 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
>  		case OPT_LISTEN:
>  			opt_listen = true;
>  			break;

[ ... ]

> +		case OPT_UDP_PORT:
> +			opt_udp_port = strtoul(optarg, NULL, 10);
> +			break;

[Severity: Low]
Does --udp-port need a range check here? The strtoul() result goes
straight into the u16 opt_udp_port, so a value above 65535 is silently
truncated modulo 65536. Only a result of 0 is rejected, by the
!opt_udp_port check and by xsk_set_flow().

xsk_load_xdp_programs() then makes the truncated value the port that the
XDP programs match on:

    ifobj->xdp_progs->bss->test_port = udp_port;

UDP traffic to an unintended port could then be redirected to the XSK
instead of reaching the stack.

There is also a separate wrap: with --udp-port 65535, the source port of
socket 1 in __test_spec_init() becomes 0:

    xsk->src_port = udp_port + j;

That wrap looks harmless. xsk_xdp_shared_umem() computes
(__u16)(0 - 65535) == 1 and still picks socket 1, and UDP source port 0
is legal.

Later in the series, the in-tree launcher drivers/net/xsk.py checks the
value with _check_opt("--udp-port", cfg.udp_port, 1, 0xffff) before
passing it on. The series leaves option range checks to the launcher, so
this only affects running xskxceiver by hand.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119164636.1071385-1-maciej.fijalkowski%40intel.com
