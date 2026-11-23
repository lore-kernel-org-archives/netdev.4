Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459598;
	b=hg/KbJcKIvIiErDO1xEwRC+A9xDfv2jyPzbpbPqOs/WcihlUc8J8z/c5y0UTbOHvuqip
	 hNPwyKUYAeuDbqmmdz349PK4LosIgo65Nj51evH4TRrgy7x2jJdif9986UrMFQGJ5K7j3
	 B1wnkITD4jcW95VIiZCYAx9xYiXdJUVyu4RqnmwqGXrB2naPRAQhr42MDcPQMkl+rmsxc
	 z3z4MuCH9wKHG3L5YSQQXA00AuxvLsy/P8tKI+t9UjkMxdt48JIkpKyq2eFgRsUIfXBsc
	 lLrqLVhKm/g8rF5mUquhJJ/71wGF7vs+uA1Oa5G2ojJzlvo/aWeOgB5L83z7ps5V/wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459598;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xHubuJhP6KN/RVRcVDqZuPXWy39mMWU82a7oBpJ/8K8=;
	b=OYyeU2tZZ/F09EJ8LL9O1zb+kgJDu1efPLJ+rrrAJnjY7+NioNKCcrK49c7DWpqllfcz
	 wB70HSMnPb1miuMd9KlBKSfAReuuB7yQ0VCRgD6GqucTawCBo0C2iNV/Jr60OQX8OdiYz
	 ed3J/I52GOHNF4HL+3GhSvt+hWPBoNiFoHX/IQ+GtR2vYqnSJ2cWwrrufPSEQw0MrHZca
	 3cptX3+V10Zsc+NiD3N5OnP4GpMjD2UEirkmbddRqoFM9KtvgDJOZImgfV0JRFDjYh5M5
	 If46foPPuDBQE/N9GYekgzfBPIHuuojyQZFyMiN0wELFCgl6616TKrEBkrxTTsmSTJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OP63MUPu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227CA606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OP63MUPu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9DA1F000C0;
	Mon, 23 Nov 2026 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459597;
	bh=xHubuJhP6KN/RVRcVDqZuPXWy39mMWU82a7oBpJ/8K8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OP63MUPuNp6yBBl6wDZPI+27zRBg3vZm6iiqDm7ci4vH384xh8m/aZWQxSY6CdiCj
	 nwfsNXUGoWEDbE8YKPMAr0XosJop/gh3Yas397z3hQAdRVo4DsTZ7fthbpA+VNr/+Q
	 Ic8fivzaGjuCsnjBD6q5IsxR1PZ/j8XqsnLw1xB05m40kIxJzimTRcSpncYD9O6drT
	 4StsdnHpQ8jwr2bqEcxknRoAg7CzgSnJLZkJEnB9cDjgBFIScp+v6kHfD9ebBnOSrt
	 DxgulB2v+2Vd9cDgR0O6HYztSXDfLmkZ5/i1Mp2EWPhClDopxXquVG1DJybwppCLea
	 tp8iJvC+SSB/w==
Subject: Re: [PATCH v5 net-next 07/13] selftests: xsk: run the RX and TX
 endpoints in separate processes
From: netdev-bot+sashiko@kernel.org
To: maciej.fijalkowski@intel.com
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org
Date: Mon, 23 Nov 2026 18:46:37 +0000
Message-ID: <179545959702.3135.5397532567873926560@kernel.org>
In-Reply-To: <20261119164636.1071385-8-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-8-maciej.fijalkowski@intel.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In this commit, a skip decision is not passed between the two
  endpoint processes, so they can report different verdicts for one case.

--

selftests: xsk: run the RX and TX endpoints in separate processes

This splits xskxceiver so that each process runs one endpoint, RX or TX,
on one interface. A shadow ifobject stands in for the other side. The
pthreads and the barrier are replaced by a TCP control channel that
carries READY, PROGRESS and ABORT messages between the two processes.

> diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
> index e0f413ee17ab7..fdf449822f026 100644
> --- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
> +++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c

[ ... ]

> @@ -1622,36 +1663,57 @@ static int testapp_validate_rx_endpoint(struct test_spec *test,
>  	return err;
>  }
>  
> -void *worker_testapp_validate_tx(void *arg)
> +static int sync_endpoints(struct test_spec *test)
> +{
> +	int err = xsk_peer_ready(ctrl_peer);
> +
> +	if (err)
> +		ksft_print_msg("Endpoint synchronization failed at step %u: %d (%s)\n",
> +			       test->current_step, err, strerror(-err));
> +	return err;
> +}

[Severity: Medium]
Can a legitimate skip on one endpoint be reported as a fail on the other
one?

The control protocol in xsk_peer.c has only these message types:

enum xsk_peer_msg_type {
	XSK_PEER_READY = 1,
	XSK_PEER_PROGRESS,
	XSK_PEER_ABORT,
};

So a peer that skipped looks the same as a peer that went away.

For example, main() in xskxceiver.c skips an unsupported mode after
setup_peer() has already connected:

	if (setup_peer(local_ifobj, shadow_ifobj, &peer))
		goto out;

	if (!mode_supported(opt_mode, caps)) {
		...
		ret = TEST_SKIP;
		goto out;
	}

At the out: label, xsk_peer_close() closes the socket without telling the
peer. The multi-buffer TEST_SKIP in __testapp_validate_traffic() does the
same thing.

The other endpoint is blocked in xsk_peer_ready() and reads EOF. That
gives this chain:

xsk_peer_ready()->peer_recv_one()->io_full() returns -EPIPE
sync_endpoints() prints "Endpoint synchronization failed"
__testapp_validate_traffic() returns TEST_FAILURE

setup_peer() copies local->caps into the shadow. Each endpoint therefore
makes its capability-based skip decisions from its own NIC, and the two
can disagree when the NICs differ.

ADJUST_TAIL splits in a similar way. testapp_validate_rx_endpoint() clears
test->adjust_tail_support only in the RX process:

	if (!supported) {
		test->adjust_tail_support = false;
		return TEST_PASS;
	}

As a result, testapp_adjust_tail() returns TEST_SKIP on RX. The TX copy
stays true, and TX reports PASS.

No in-tree launcher runs xskxceiver at this commit. Later in the series,
"selftests: xsk: prepare xskxceiver for endpoints on two hosts" adds
XSK_PEER_SKIP and xsk_peer_skip(), and sync_endpoints() then returns
TEST_SKIP when the peer skipped. After that, "selftests: drv-net: run the
AF_XDP tests over veth or a NIC" adds xsk.py, which reports the RX SKIP /
TX PASS combination as a skip.

Would it make sense to send the skip notification to the peer in this
patch, so the verdicts also match at this point in the series?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119164636.1071385-1-maciej.fijalkowski%40intel.com
