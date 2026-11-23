Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459594;
	b=41TjQoi95979dgdWV1vmq0g2ZtZ83BcNkC+EqQLhL35ChHPLy84ZrMC2t71VYBblVfw2
	 OjIdRZyyNaptI7i8myW9nFD9O8BvYnnis0YwNyUGGCOoZ5/2Uuc00gzsVa4nnTcyaDplu
	 q1NzQdpn85GUuebDoaqP39bcexrUg7Z+c9xa5HXHu5vrwKfXMhnwH9gxKvnrRfdB8iviE
	 BEjJK+5AaE2QiBAixnpf5dn40C2+Y20ZFDAqUIZ4j/6h9hEN17seyuAgDsPr70DnTCMa5
	 L6pdcOpJnmiAdAcCEUeABqbZwvj8KbB46bRYS/sZWiUiNvXkGfU8KLyYy1WZsaaJjYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459594;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CK4bj4ETGSuMjf+bBniHN5elZgX+mhEpv9dbVOTCqHo=;
	b=WiBufhuyMBWbwE4Y3E6+eb555Ef8azdAkCvu2Knwf4nnKuy22Z/ox1anjqrFeaCTKNmf
	 NmPYuF95g8miKw+VzLempEbpaANWGaQkhgLBF0V1fy7O8bpk5n91VfyzGfBei+/+TX8//
	 l6fVHExSGmP9aWEofUMg/AR5KqUxLwjLkDekDwmtS2BH5dnOGNrGI+Ha46f47kxs38JeE
	 CfTPBjyexWUslCnK8oCFUCyfnhpmXkDTh2qYqcP1uDMRNrDMH9+LlNK4GuX7j2Cd1Kn6c
	 DxR97MBan5xQbFhRCUPECJHpSfO17uNwid7URiINKUVP0URrg06Gs7lSbWW2SJLx1fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jv3WVORy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5E606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jv3WVORy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4FE1F000C4;
	Mon, 23 Nov 2026 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459593;
	bh=CK4bj4ETGSuMjf+bBniHN5elZgX+mhEpv9dbVOTCqHo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jv3WVORyte8AcCQ0AKxEvltVL1ULTbighWAhoTlLa3L79NxTgdhkcN58cBJs9ANOZ
	 xSUCa/ZEDJPnrROiqu4xAveoDXtwR8luV8k+lfj1U47NKgXgecBmVwUAH61YI1tLaf
	 Qv9EDLeiy8fnfOaO4ZFdtWSbf35xX7xy8xg0U/7P7YwnXbBntQHppSCX3g9sqYnOs1
	 cZ+t/ciuF07boEj6d00DNzeii9DR4VvnV7JAPXAF2UGGTBy63aqSRJj1REsZR4ewKE
	 Hi4ihUUAVzPpuqqEZS6xTf6PDOgrAEqV/GQE/Km5Vxx/edPCVTaerRhkJJWsfDj8jp
	 yeLnmj3W8Hc4w==
Subject: Re: [PATCH v5 net-next 02/13] selftests: xsk: size the TX UMEM in
 HW_SW_MAX_RING_SIZE
From: netdev-bot+sashiko@kernel.org
To: maciej.fijalkowski@intel.com
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org
Date: Mon, 23 Nov 2026 18:46:32 +0000
Message-ID: <179545959251.3135.2838051579849778301@kernel.org>
In-Reply-To: <20261119164636.1071385-3-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-3-maciej.fijalkowski@intel.com>
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

- [Low] The commit message and the new code comment describe the wrong
  failure mechanism, and the wrong threshold, for the batch cap.
- [Low] The patch fixes HW_SW_MAX_RING_SIZE failures that can be hit on
  the current code, but it has no Fixes: tag.
- [Low] Two comments in testapp_hw_sw_max_ring_size() do not match the
  new batch-size computation.

--

selftests: xsk: size the TX UMEM in HW_SW_MAX_RING_SIZE

This sizes the TX UMEM in testapp_hw_sw_max_ring_size() the same way as
the RX UMEM: 8k frames, plus 8k fill and completion rings. That lets the
test work with two interfaces, where TX has its own UMEM. It also caps
the second-step batch at min(tx_max_pending, 8192) - 8, and skips the
case when the HW TX ring has 8 or fewer descriptors.

> diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
> index 74eea4a4dfebd..0b2aa6919d72d 100644
> --- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
> +++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
> @@ -2504,8 +2504,16 @@ int testapp_hw_sw_min_ring_size(struct test_spec *test)
>  int testapp_hw_sw_max_ring_size(struct test_spec *test)
>  {
>  	u32 max_descs = XSK_RING_PROD__DEFAULT_NUM_DESCS * 4;
> +	u32 batch_size;
>  	int ret;
>  
> +	/* The second step sends batches of tx_max_pending - 8 descriptors. */

[Severity: Low]
This isn't a bug, but this comment leaves out the max_descs cap that the
patch adds further down. The batch is now
min(tx_max_pending, max_descs) - 8. Whenever tx_max_pending > 8192, that
is 8184, not tx_max_pending - 8.

The edited block comment above the batch_size computation also still
starts with "Set batch_size to 8152 for testing". That is only true when
tx_max_pending == 8160 (ice).

Could both comments be updated to describe the capped value?

> +	if (test->ifobj_tx->hw_ring_size_supp &&
> +	    test->ifobj_tx->ring.tx_max_pending <= 8) {
> +		ksft_print_msg("HW TX ring too small.\n");
> +		return TEST_SKIP;
> +	}
> +

[ ... ]

> @@ -2513,6 +2521,9 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
>  	test->ifobj_rx->xsk->umem->num_frames = max_descs;
>  	test->ifobj_rx->xsk->umem->fill_size = max_descs;
>  	test->ifobj_rx->xsk->umem->comp_size = max_descs;
> +	test->ifobj_tx->xsk->umem->num_frames = max_descs;
> +	test->ifobj_tx->xsk->umem->fill_size = max_descs;
> +	test->ifobj_tx->xsk->umem->comp_size = max_descs;

[Severity: Low]
This change, together with the batch cap below, fixes failures that the
current code can already hit.

With two different interfaces (xskxceiver -i ethA -i ethB), TX has its
own UMEM, which keeps DEFAULT_UMEM_BUFFERS (1024) frames while the first
step uses a 2048-descriptor batch. The in-flight limit in __send_pkts()
then comes out as -1024, and RX times out, as the commit message itself
describes.

In single-interface mode on a NIC with tx_max_pending >= 8200, the
second-step batch of tx_max_pending - 8 uses up the whole 8192-frame
UMEM, and the case fails the same way.

Should this have a Fixes: tag pointing at the commit that added
HW_SW_MAX_RING_SIZE, so it can be found for stable? At the moment it is
described only as preparation for removing the single-interface mode.

>  	test->ifobj_tx->xsk->batch_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
>  	test->ifobj_rx->xsk->batch_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
>  
> @@ -2521,10 +2532,12 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
>  		return ret;
>  
>  	/* Set batch_size to 8152 for testing, as the ice HW ignores the 3 lowest bits when
> -	 * updating the Rx HW tail register.
> +	 * updating the Rx HW tail register. __send_pkts() waits until a whole batch fits
> +	 * in the XSK TX ring, so keep it below that ring's size on NICs with larger rings.

[Severity: Low]
Is the XSK TX ring the limit that actually fails here? The commit message
says:

  With a HW TX ring of more than 8200 descriptors, the second batch would
  also outgrow the 8k XSK TX ring, and __send_pkts() would spin forever
  waiting to reserve it

In __send_pkts(), the in-flight check runs before the
xsk_ring_prod__reserve() loop:

	if (pkts_in_flight >= (int)((umem_size(umem) - xsk->batch_size * buffer_len) /
	    buffer_len) && !test_timeout) {
		ret = kick_tx(xsk);
		if (ret)
			return TEST_FAILURE;
		return TEST_CONTINUE;
	}

The UMEM has 8192 frames, and buffer_len is the 4096-byte frame size for
MIN_PKT_SIZE, so the limit is 8192 - batch_size. With
batch_size = tx_max_pending - 8:

- at tx_max_pending == 8200, the limit is 0
- above 8200, the u64 subtraction wraps, and the (int) cast gives a
  negative value (-8 at 8208)

pkts_in_flight starts at 0, so the check is true on every call. TX never
reaches the reserve loop, and RX ends up hitting THREAD_TMOUT.

Would it be more accurate to say that the case times out on the UMEM
in-flight limit from 8200 descriptors up, rather than spinning in
reserve above 8200? The cap itself (8184, which leaves a limit of 8)
looks correct; only the explanation in this comment and in the commit
message seems off.

>  	 */
> -	test->ifobj_tx->xsk->batch_size = test->ifobj_tx->ring.tx_max_pending - 8;
> -	test->ifobj_rx->xsk->batch_size = test->ifobj_tx->ring.tx_max_pending - 8;
> +	batch_size = min(test->ifobj_tx->ring.tx_max_pending, max_descs) - 8;
> +	test->ifobj_tx->xsk->batch_size = batch_size;
> +	test->ifobj_rx->xsk->batch_size = batch_size;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119164636.1071385-1-maciej.fijalkowski%40intel.com
