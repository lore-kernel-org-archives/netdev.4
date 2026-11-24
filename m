Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483788;
	b=imkTrLW3poxi2VGpZpzYCbcfwZNbkjcuPyO2XZHXsojppggN+9nECDCZl7BuPtzQYr52
	 kee5g8cqPqRbU/cIXEb9vTYymEzt1mGBMCKFc4esgFiqOVdUIZB45mPSWasj++dlg5ejR
	 L2h6h52MfXBBayeZQHEC6KT9WnyFyLJZCWQ4OnxdX2l6VLSCHTH6IXQAyLz+TNH8YfTmw
	 u2IwwW296DOdHqhhJGq73eOBjBsrm2RDAotF5auwWZe3gD/NQ9nc2BUOBXEhFiJKkPXTZ
	 NM2OXQfA2iAa3Ob2rMoCUOC0FxQJmveqkLyhmbzcqH9zVxIODtZ97EOefSxDJe1f0Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483788;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=esXqn36gy68db9UiWQjuL/vzS+1L6JPKiOHrC3zaYYk=;
	b=FjQ6SENUXjASeD2LMHM5u7GGFQo5KizEk3NqBDQpg0mRNMXD+CL/ldYwttF3vD2EMOfY
	 7+xfNKQq70BzK/xWsuOK8iTrqNashbosPJ2I4H34UVTpl7E5cwZrTyUl13eTZCA0mnVdd
	 KTnWslkEJN7rYNRLwVlzyIkEVIpL9DH9b3oPAvNTlqz0vYSL2icAzSCnlo89Ncgq/ZWn9
	 fZV7F8nxZDqdU8V/W5kwngwMTcink6aJ01L7ViMIiGj8OPloB8u8GdgZKB0vglMM+1TPl
	 Vfi/d/smhXfJlEJEY322jdP9+BmhiEckF+vfL5OQcJbPJ1Ycqw24W5YOs8Tb1/Lu8qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmlWvdTI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692B606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmlWvdTI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F161F000C0;
	Tue, 24 Nov 2026 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483787;
	bh=esXqn36gy68db9UiWQjuL/vzS+1L6JPKiOHrC3zaYYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FmlWvdTIUvLmY6aRbe3hzQw4ShrsAXlfD3OhAtCdyJGrT1O9npFaw+ck3Lrz2bczS
	 zn/cJ0uk5BKETOFzSeylju2OacS1s6VDm6mvMXOwh+kYGBphbh5EIuOnjvBs+bgDzy
	 POiVndGUFBkNdtv9CfErch921rgCGru2vc03GjE2cgKn86IF7+DiJiKBkJlFE4ko/a
	 2hkrqHAkcf+tBP/QHQIKveQ9kGaK4hpyncSU620/xmwEE47tlESP9D12rz7BdjeIzp
	 clSTt3pnbg2qQaMaXRKxtbR7NtHdMkR0WQdKbY6RheZAZyV3HUfyw8XQK/4JhJM8Xq
	 J0tn80GMNPZGw==
Date: Mon, 23 Nov 2026 17:29:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org
Subject: Re: [PATCH v5 net-next 12/13] selftests: drv-net: run the AF_XDP
 tests over veth or a NIC
Message-ID: <20261123172946.54f8323a@kernel.org>
In-Reply-To: <20261119164636.1071385-13-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
	<20261119164636.1071385-13-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 17:46:35 +0100 Maciej Fijalkowski wrote:
> +Without NETIF, the interfaces are a veth pair with the remote end in a
> +network namespace of its own. Each listed case runs in SKB and DRV mode,
> +with the local endpoint receiving in that mode. A copy-mode socket sends
> +alike in both modes, so the remote endpoint sends as it would in DRV mode.
> +The variant name starts with the mode, e.g. test_xsk.drv_SEND_RECEIVE. The
> +cases in VETH_XFAIL cannot pass over veth and are reported as expected
> +failures without being run. veth does not tie its NAPI instances to its
> +queues, so a socket on it has no NAPI to busy poll.

I think it does now? Merged last week.

> Only the initial
> +network namespace has the net.core.max_skb_frags sysctl, so the remote
> +endpoint takes 17 frags. --max-frags hands the sysctl value to both
> +endpoints for TOO_MANY_FRAGS, but the cases in TAILROOM_CASES size the
> +UMEM tailroom by the value of each endpoint, and are expected failures
> +when the sysctl is not 17.
> +
> +With NETIF, the local endpoint runs in zero-copy mode on NETIF, the DUT,
> +and binds to its last queue, and the remote endpoint binds to queue 0.
> +Before the cases run, main() takes the DUT queue out of RSS and adds an
> +ntuple filter on each host that steers the test UDP flow to the queue of
> +the receiving endpoint, and it undoes that however the run ends. A NIC
> +that rebuilds its RSS indirection table on a reset, such as one for an
> +XDP, MTU or ring change, puts the queue back into RSS, so a case fails if
> +the queue is back in RSS after it.

Yeah but that'd be an outrageous driver bug :/ If AI made you mention it
- drop it pls.

> +# The TX ring of the sender and the RX ring of the receiver that a case
> +# needs at a given size, 64 being the default batch size of xskxceiver.
> +RING_SIZES = {

We usually "glue" this sort of cached state onto env and check for it
being cached already with hasattr() but I guess global is fine...

> +def _setup_busy_poll(ifname):
> +    """Set napi_defer_hard_irqs and gro_flush_timeout of ifname until the
> +    case ends, so that SO_PREFER_BUSY_POLL of xskxceiver -b keeps the IRQs
> +    masked."""
> +    for attr, val in (("napi_defer_hard_irqs", 2),
> +                      ("gro_flush_timeout", 200000)):
> +        path = f"/sys/class/net/{ifname}/{attr}"
> +        old = cmd(f"cat {path}").stdout.strip()
> +        if old == str(val):
> +            continue
> +        cmd(f"echo {val} > {path}", shell=True)
> +        defer(cmd, f"echo {old} > {path}", shell=True)

ctl_file_write(), ask you agent to check for lib helpers perhaps?

> +
> +
> +def _restore_rss(cfg, indir):
> +    """Restore the RSS indirection table of the DUT. Reset it to the default
> +    first, which leaves it to the driver again, and write indir back only if
> +    it was not the default."""
> +    ethtool(f"-X {cfg.ifname} default")

IIRC indir table of 0 size is the same as reset so you can add below an

> +    req = {"header": {"dev-index": cfg.ifindex}}
> +    if cfg.ethnl.rss_get(req).get("indir") != indir:
> +        cfg.ethnl.rss_set({**req, "indir": indir})

	else:
		cfg.ethnl.rss_set({**req, "indir": []})

instead?

> +def _reserve_queue(cfg, undo):
> +    """Take the last queue with both an RX and a TX ring out of RSS until
> +    undo, return None if the DUT cannot. A TX endpoint fills no RX buffers,
> +    so in zero-copy mode its queue drops what it receives, the control
> +    connection included."""
> +    req = {"header": {"dev-index": cfg.ifindex}}
> +    try:
> +        ch = cfg.ethnl.channels_get(req)
> +        rss = cfg.ethnl.rss_get(req)
> +    except NlError:
> +        print(f"1..0 # SKIP cannot get the channels or RSS of {cfg.ifname}")

No no, never print() in netdev py tests. You're not allowed to output
any TAP directly. let the ksft_run() handle that. If you need to print
something - ksft_pr() which does necessary escaping.

> +def main():
> +    """Run the cases over veth without NETIF, else on NETIF."""
> +    # defer() works only within a case, so undo restores what main() sets up
> +    # for all of them, however the run ends.
> +    with NetDrvEpEnv(__file__, veth_test=True) as cfg, \
> +         ExitStack() as undo:
> +        cfg.bin_local = cfg.net_lib_dir / "xskxceiver"
> +        if not cfg.bin_local.exists():
> +            print(f"1..0 # SKIP {cfg.bin_local} was not built")
> +            sys.exit(SKIP_CODE)
> +
> +        # Before _setup_nic(), as ntuple-filters can reset a NIC.
> +        local_dmac = _next_hop_mac(cfg, cfg.remote_addr,
> +                                   cfg.remote_dev["address"], cfg.ifname)
> +        remote_dmac = _next_hop_mac(cfg, cfg.addr, cfg.dev["address"],
> +                                    cfg.remote_ifname, cfg.remote)
> +
> +        cfg.udp_port = rand_port()
> +        if cfg.veth_test:
> +            _setup_veth(cfg)
> +        elif not _setup_nic(cfg, undo):
> +            sys.exit(SKIP_CODE)
> +
> +        cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
> +
> +        saved_hugepages = []
> +        undo.callback(_release_hugepages, saved_hugepages)
> +        cfg.hugepages = (_reserve_hugepages(saved_hugepages) and
> +                         _reserve_hugepages(saved_hugepages, cfg.remote))
> +        if not cfg.hugepages:
> +            _release_hugepages(saved_hugepages)
> +            saved_hugepages.clear()
> +
> +        cases = _get_cases(cfg)
> +        _set_args(cfg, local_dmac, remote_dmac)

You're doing way too much outside the test cases. Don't optimize for
execution time, let each test case prepare a clean environment. If
we want to optimize for shared prep we'll do it later in a structured
way, inside ksft_run(). Not now.

> +        tests = [ksft_variants(cases)(test_xsk)]
> +        if not cfg.veth_test:
> +            tests.append(ksft_variants(cases)(test_xsk_busy_poll))
> +        ksft_run(tests, args=(cfg,))
> +    ksft_exit()

