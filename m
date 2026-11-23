Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395974;
	b=OPol4MpuV2xmzHCN2qF9dDWSu7+NZI1UiltviQVcqlkdbcaHXeEAP8FGY17S724JTMwR
	 TbP44ByHY1XHk+zCAsDFztQ+E5yHPAqIXtvObUvD5nefZfE9j1EzwsYx0WS7kilZ37lBN
	 9K7fEIrZBz/FoLtMWgLr+ZeqserFJIj+17FOVESSkmJ9UbsL55kRTvgyxdxkUtmj/giOl
	 tizK71tcjpb+scAxvcc+mJZEVlpefHTL5rK08vJ76qGD6D4emGcx9v8uRkkuBydW0MnN8
	 21npm8xKVYxXt4B0Oghgi3Tr1fAaa+3HLgYxnK88jUYalhzozo9tlZ/djC4mvYdg6Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395974;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=m1kYw4ZrlZ5dWwlbPQBHBTRCJTHoFiCBu7iltfS40Aw=;
	b=cRkX1qMdsk1QfAjCFFNjigMQj8j3Kq6NrfHQCVcL25wa7F+5w4pnhxa2pdteLzecwRjM
	 Qgnxo4skPUst7fuQzGotUEpipxfRytwlldGGxYNnKNqPDcsUgCRtdWYweveQHzmcyzTtT
	 EmmiGM2COEEKBunVgVz5SaogPSTID4q6IP1Oqn34dlwtAvyOPcOwXbyVbxKD/EScFLgp6
	 4aEXq7GuWzcBRiqzweKxyB+On2kcdKz/MV0xgSQS0JHygQLegsuph7lrqa5vXRVwd+OL2
	 aVwkosj2TjKDvUFizkugAkzHMiLWH2VYFJSx9J9XOEloTeEGXzzJxLRhwtO+GvqJh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0ETGGx4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E48606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0ETGGx4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C101F000C0;
	Mon, 23 Nov 2026 01:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395974;
	bh=m1kYw4ZrlZ5dWwlbPQBHBTRCJTHoFiCBu7iltfS40Aw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J0ETGGx4kggl667GPY0Jp3oCOKY8tofipGVE85QP/dYm84HgEVCAaFeLSw0eHS95m
	 nxzxkZtor0D9OQhmOL5lSigPRaz0nFRWud1Arp8EwF5geKV052TWcSjtnrkVx9RhC8
	 KP6SFkfjf59zVDWNNjtKeNuB+1QciOl2pnWFsqvzeAcEn+neHGXQC9jLzJL5BXdY4c
	 lcH8r2rj6QCZHjB1y6+VeAlSNRcxQr1gh+T+Uz2kgMq8HLtgkDsZUxrNwpKzPDQggF
	 XbSL6LtIXrElyv/nAk65UqsNsHzTauw73WR5NC0sw8FjMYtigzfbifRl4VOmc9I69E
	 aNYT1mYyTjExg==
Subject: Re: [PATCH net-next 7/8] ibmveth: Pass the RX queue index through
 replenish and poll
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Mon, 23 Nov 2026 01:06:12 +0000
Message-ID: <179539597289.3135.13448321447198422850@kernel.org>
In-Reply-To: <20261119000711.18093-8-mmc@linux.ibm.com>
References: <20261119000711.18093-8-mmc@linux.ibm.com>
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

- [Low] This patch adds the queue_index parameter in inconsistent
  positions across the RX buffer helpers in…

--

ibmveth: Pass the RX queue index through replenish and poll

This patch adds a queue_index parameter to the rxq_* accessors and to the
RX buffer lookup, harvest and replenish helpers, which used to hardcode
queue 0. ibmveth_poll() now gets the queue index from its NAPI instance.
Only queue 0 is used, so the behavior does not change.

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index ab8c5f6a265b4..a40d9a6abf51b 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c

[ ... ]

> @@ -909,17 +922,20 @@ ibmveth_free_buffer_pools(struct ibmveth_adapter *adapter)
>   * * %-EFAULT - pool and index map to null skb
>   */
>  static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
> -					   u64 correlator, bool reuse)
> +					   u64 correlator, int queue_index,
> +					   bool reuse)

[Severity: Low]
This isn't a bug, but could queue_index go before correlator here, so it
matches the other RX buffer helpers in this patch?

ibmveth_rxq_correlator_valid(), ibmveth_rxq_get_buffer() and
ibmveth_rxq_harvest_buffer() all take (queue_index, correlator).
ibmveth_remove_buffer_from_pool() takes (correlator, queue_index), and its
kernel-doc also lists @correlator before @queue_index.

Because of this, ibmveth_rxq_harvest_buffer() has to swap the arguments
when it passes them on:

    rc = ibmveth_remove_buffer_from_pool(adapter, correlator, queue_index,
                                         reuse);

int and u64 convert to each other without a warning. A future caller that
follows the sibling order would compile cleanly, but it would index
adapter->rx_buff_pool[queue_index][...] with a truncated correlator.

All current callers use the correct order, including the KUnit tests. The
later patch in this series, "ibmveth: Split RX poll into per-slot helpers
for MQ", keeps the same order.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119000711.18093-1-mmc%40linux.ibm.com
