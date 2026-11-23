Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395976;
	b=QzKEMieEU5B1Rk36GWaYHBgHoabjTFtPqQSAk1KJPY+RvVBt0lBdVRMeXEgjOKzE53ly
	 2ZzldI7RDTsFx0Pl3dHCnpZxFVMN7MBXZAnHKEqbuvwuqtU/U6KHF4+XH95TdfYCo/pxB
	 qVzmNtpTJN44b+9L3QncvYNFdhYNsC7Sb4aZNnUMgF/B12tMnmPyhPxpPOdPPjPrei3Q1
	 fZ5AmVoof0DTi6Gl8NZt23490V7SuC+iwYb7PuQihBz5PHYgPcVN0FY3ZLHwdPDVmZ3rH
	 qP18b4i2Fo7kFjzp5MLiYi3ly/zii58CjgAHa4ARBovw6a4Za65ZINBX/G2wi/0c/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395976;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GT8u9eDgHjpLy1q95C+aJQ3RfZ/aTWtvLFOTauQjW14=;
	b=4buo2PcAhIxvbxOCG8Uqj+Oqqt55AfqwTox34Jrque+QHixZP6ZLuTJLavK9QZO3f4WO
	 6WOld/RqITkNIAzsiVIcba86fr3NZlR5qWs3aOcIrbUHablWlP5fiFfn6H9HSfUZ1LQEK
	 V+yX06uYf5t/WSmbs/7piGrBbPHJDbGME0ayUpxqDjtmX7IMtqF9XTzxgJzdCzBK4H5Ci
	 RmtKXjKXTITUuk8E6dyWePAlTIo5+tR4wUACTEqIEsTh3hCtV4JlVRlRXLerz2vxU8fGo
	 IZsRn+CSBlUiQszgxPWimQtJxH4wPAQtdJLu02ocHcyNaEnqqVTXdShXW/ciFh9j0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P06DhByh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC6606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P06DhByh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CFE1F000C0;
	Mon, 23 Nov 2026 01:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395976;
	bh=GT8u9eDgHjpLy1q95C+aJQ3RfZ/aTWtvLFOTauQjW14=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P06DhByhBLMb9DZoTx3L1qvZ5ZKjzu6QlCW6TGHKLNrAoqvIU3uouKFO1HQSMaeQr
	 Ju3+AIkPlAv5HBMkIkFs3JUuqnP099GraoLCtcxr6CSKOas3EPo8BWvWQfn/QlKDIj
	 Bjz9htPslbQCymHIaLVHA3Ddk98924TZwdEldEtYejJ3Pp6vT18hBN7SS/LsMx2f2n
	 BJs0ozXwIMHoOcMmPMqV8jEsXlaHLiteHrl+9z8sz2z1Tgr/5AnPT2TZdQq0pWEjCP
	 FdWf2GEjnIoW6LYgvAzypQiTdpeyFINHTOshcswh8e1jX80kiLQiaoRgDOdj0X60qR
	 DEOrZ5UPlRwZA==
Subject:
 Re: [PATCH net-next 8/8] ibmveth: Split RX poll into per-slot helpers for MQ
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Mon, 23 Nov 2026 01:06:14 +0000
Message-ID: <179539597459.3135.8252131963439580422@kernel.org>
In-Reply-To: <20261119000711.18093-9-mmc@linux.ibm.com>
References: <20261119000711.18093-9-mmc@linux.ibm.com>
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

- [Low] The helper ibmveth_poll_drop_oversize() in
  drivers/net/ethernet/ibm/ibmveth.c has a misleading name, and the…
- [Low] Two comments still name ibmveth_poll() as the place where per-
  slot RX handling happens, but this patch moved that code into new…

--

ibmveth: Split RX poll into per-slot helpers for MQ

This commit moves three pieces of per-slot RX handling out of
ibmveth_poll() and into new helpers: the invalid-slot recycle, the
bad-frame drop and frame delivery. The bad-frame error message now also
prints the queue index. Otherwise the commit intends no behavior change.

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index a40d9a6abf51b..a36dafb8e8937 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -1995,6 +1995,148 @@ static void ibmveth_rx_csum_helper(struct sk_buff *skb,

[ ... ]

> +static void ibmveth_poll_deliver_frame(struct napi_struct *napi,
> +				       struct ibmveth_adapter *adapter,
> +				       struct net_device *netdev,
> +				       int queue_index, u64 correlator)
> +{

[ ... ]

> +	skb = ibmveth_rxq_get_buffer(adapter, queue_index, correlator);
> +	if (unlikely(!skb)) {
> +		ibmveth_rxq_advance(adapter, queue_index);
> +		netdev->stats.rx_dropped++;
> +		return;
> +	}

[Severity: Low]
This get_buffer failure branch now lives in ibmveth_poll_deliver_frame().
Are two comments elsewhere in ibmveth.c out of date as a result?

The kernel-doc for ibmveth_rxq_harvest_buffer_test() still says:

 * the toggle at the end. This covers the harvest path; the advance after
 * ibmveth_rxq_get_buffer() fails in ibmveth_poll() is not tested here.

ibmveth_poll() no longer contains that ibmveth_rxq_advance() call.

The kernel-doc for ibmveth_rxq_harvest_buffer() also still says:

 * Context: called from ibmveth_poll

Its direct callers are now ibmveth_poll_recycle_invalid(),
ibmveth_poll_drop_oversize() and ibmveth_poll_deliver_frame(). That one
is still roughly accurate, because these helpers are only reached from
ibmveth_poll(). The test comment, though, now names the wrong function.

> +
> +	pool = correlator >> 32;
> +	bpool = &adapter->rx_buff_pool[queue_index][pool];
> +	room = min_t(unsigned int, skb_tailroom(skb), bpool->buff_size);
> +	off = offset;
> +	len = length;
> +	if (unlikely(len < ETH_HLEN || off >= room || len > room - off)) {
> +		ibmveth_poll_drop_oversize(netdev, adapter, queue_index,
> +					   off, len, room, correlator);
> +		return;
> +	}

[Severity: Low]
This isn't a bug, but does the name ibmveth_poll_drop_oversize() fit
what this helper handles?

It is called when any of these three checks fail:

    len < ETH_HLEN || off >= room || len > room - off

Only the last check means the frame is too large. The first one catches
frames shorter than an Ethernet header. The second catches an offset
that lies outside the buffer.

The message inside the helper is already generic ("bad RX frame offset
%u length %u (buffer %u) on queue %d, dropping"). The commit message,
however, uses the same narrow wording as the helper name:

  Move the invalid-slot recycle, the oversize-frame drop and frame
  delivery out of ibmveth_poll() into helpers.

Would a name like ibmveth_poll_drop_bad_frame() be a better match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119000711.18093-1-mmc%40linux.ibm.com
