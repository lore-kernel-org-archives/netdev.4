Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459596;
	b=ELeYZsUG599vC48IoGp7MofWgnk+Y7QoRYLRnbY10VbLGb6YDCH2Z9siORjNwKN9xkbd
	 U1oAnnH+69d7vH/Lu5/i9jOOQS77Wgp/lYOFxxUeW141H0Nv+cvPnF6mBcZQTj1Y87hc2
	 fmMVMfPeoVQG4hQSdRwWuMQ+TpfLEYYtlFahPM6Nl80724rxL3UUhIb4TrV4jgDGZ9cjc
	 PzUpr6Cboooew00CjBf+KSLdCBnmsrg4iGdkZFXzsksvajSRg92lBuvesGtRrKYIihDDO
	 Gdsfq4yclqoR/ON+K1dPS40WHEG4L5iOEzWPJNP+yfHBKxcscNuPtUclMt0gH/NjYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459596;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=000l8wx5L/kXs85hi530hSpUh858866LKA6/wEQ6zqk=;
	b=ku1uYC0/YHDDi3NwRzYDoxzUdr0xGA567l+B8booWD0kOiMHwNKmV9KhPsNfp/ZpYZWZ
	 pUEHJS3dIZvnEw2IqRnRyVpMbsACLBGczlIlnZgixqnvYG7cXqFsWcK72N957v3a/KF07
	 uTDrmtlvu/nnGVhjK68gP3oKcmHtbvQvlaWMMkP1Z7l3AU3JOflt2J/2pmqYkxNXK4xcW
	 T+hHOKAk94U97Js+c/Z4B5sfDpdpdSgojL6UpO752NvjLFYLhRCB4ASV3LEhfShzx5bUn
	 2JPVx2UpZCSFdU4wMk6ALpWpWG55GcCT3sEJtu7jdlT9aIgqGTA3rVX8iEpmUTa5VLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eG+lDG+O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E2606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eG+lDG+O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD111F000C0;
	Mon, 23 Nov 2026 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459596;
	bh=000l8wx5L/kXs85hi530hSpUh858866LKA6/wEQ6zqk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eG+lDG+OcTtIp+tbt6RbD5tZcHSgrvOFF4zH0q1y2JXMrSZcM9pbydFyLS0H1Gq2J
	 P7orE9FqyLeYf4CfsF3z54tX0hc42OLjd/JtBORF0vuMzI4ZyUKs+IAVvd6WxyALpQ
	 2fTDRscvhTLy41qpos/b82vxmOdpqvfU/eCfScrib49DMMct89UhK5C0pjJpBjU57p
	 dj2sgmOpl3GPxgKe59TmdDfgrUYsDc4d33kk8aJYCw/W4ugHpr07ehGPxDF2By/Q4J
	 kcH8tH6fWxji34UirJ2RxGGZu8+Ha8ElFeQnSH5vaLlulRMjWrlm0IiMWa0c0vw9jq
	 /br89nXdpalnw==
Subject: Re: [PATCH v5 net-next 06/13] selftests: xsk: run one test case per
 xskxceiver invocation
From: netdev-bot+sashiko@kernel.org
To: maciej.fijalkowski@intel.com
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org
Date: Mon, 23 Nov 2026 18:46:35 +0000
Message-ID: <179545959547.3135.15027004543719425053@kernel.org>
In-Reply-To: <20261119164636.1071385-7-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-7-maciej.fijalkowski@intel.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] At this commit, test_xsk.sh and xsk_prereqs.sh are deleted, and
  the xskxceiver.c header and the lib/Makefile XSK_SRCS comment point at…

--

selftests: xsk: run one test case per xskxceiver invocation

This commit changes xskxceiver to run exactly one test case in one mode
per invocation. It now requires -m and -t, and it skips unsupported modes
instead of exiting with XFAIL. It also removes test_xsk.sh and
xsk_prereqs.sh, and points the comments at drivers/net/xsk.py, which a
later patch in the series adds.

> diff --git a/tools/testing/selftests/net/lib/Makefile b/tools/testing/selftests/net/lib/Makefile
> index 0a6cd733883d1..84e3d220d5aa2 100644
> --- a/tools/testing/selftests/net/lib/Makefile
> +++ b/tools/testing/selftests/net/lib/Makefile
> @@ -35,7 +35,7 @@ include ../../lib.mk
>  BPF_PROG_DIRS := xsk
>  include ../bpf.mk
>  
> -# AF_XDP test engine used by net/test_xsk.sh.
> +# AF_XDP test engine used by drivers/net/xsk.py.
>  XSK_SRCS := $(filter-out %.bpf.c,$(wildcard xsk/*.c)) \
>  	$(top_srcdir)/tools/lib/find_bit.c
>  
> diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> index 97eece4c57f89..b72e9332bf705 100644
> --- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> +++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> @@ -6,7 +6,7 @@
>   * Linux kernel samples/bpf/xdpsock* and modified
>   * for use.
>   *
> - * See test_xsk.sh for detailed information on test topology
> + * See drivers/net/xsk.py for detailed information on test topology
>   * and prerequisite network setup.

[Severity: Low]
At this commit, tools/testing/selftests/drivers/net/xsk.py does not exist
yet. That means this header comment and the XSK_SRCS comment in
lib/Makefile both name a file that is not in the tree.

With test_xsk.sh and xsk_prereqs.sh removed, nothing in the tree creates
the veth pair or applies the busy-poll tuning that setup_vethPairs() did
in the deleted test_xsk.sh:

	ip link add ${VETH0} numtxqueues 4 numrxqueues 4 type veth peer name ${VETH1} numtxqueues 4 numrxqueues 4
	...
	echo 2 > /sys/class/net/${VETH0}/napi_defer_hard_irqs
	echo 200000 > /sys/class/net/${VETH0}/gro_flush_timeout

Is it intended that checking out or bisecting to this commit leaves no
in-tree way to run the AF_XDP cases?

The commit message says that test_xsk.sh was in TEST_PROGS_EXTENDED, so
the default run_tests loses no test. A later patch in the series,
"selftests: drv-net: run the AF_XDP tests over veth or a NIC", adds
drivers/net/xsk.py. That runner sets up the veth pair through
NetDrvEpEnv(veth_test=True) and repeats the busy-poll tuning in
_setup_busy_poll(). The old IPv6 disable step is no longer needed,
because the programs in xsk_xdp_progs.bpf.c redirect only test packets and
return XDP_PASS for everything else.

Could the comments here say that drivers/net/xsk.py is added later in the
series, or could the new runner land before the old script is removed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119164636.1071385-1-maciej.fijalkowski%40intel.com
