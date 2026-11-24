Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532469;
	b=36nReVKzGkVbjcsok71j+73dPYa2+wXaYTYiIE8ntc5lcsydHDvGFzgq97HGg9ufq6L0
	 qdem4o1TVAUSR5DQZVLR75wUwg4DUBLoR69CXXIfZb2Imq1i/vAipdEmWH7SBwtoPpaGv
	 fT4I0slOchPxjMReKZ6hbarRFk/m3PSd4BB/qgOwJiU0h8nxg3zGQGPBXgKi8W5wOFAtt
	 kxlJSofVGWgIm5UoyM1z2sbNQZ8k0Y4UKPllYPdG5euLULllZ8stbc0VP9HGQUtmhPvQr
	 9IRZ3naV6Wx84lu4jLsIL4FJqJdCvlDuc8bc26KYGS01hM53GOkGyJtlFKBkPpqz+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532469;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rSwblT0wDnKcCiXOu3brWaFUlsVqCMVE+zVB8mUsu7Q=;
	b=2nTrTlbfnlVVHyYFdSQb6IlY4yoL1DOkbf4mm2xKilsWlMgxnZEeaUuGHf1fakNMjx0P
	 cP2jAJNFOs3qqDwrVrjGXbTLuctF4yNJCkGuqXbR4aTgqlSVdVwq0c3Bv1H4g3nJMI6fK
	 M0HqgUGhgoIv7db2MbaMF87JyHRMDU8devFkgVon+pHTNywRRhvqbolW+nbWOVc8zNd8O
	 5O1F3Uf41E82o3SEnfYVg68WVe30hAJ0sc4lXPA+ibMLCUSM6Wm1IB7lufuwT1OfFxUGl
	 Zr8J4ajHIoX3awlAXQXB3848jNcpXtBwE7J0RHjtVsU8SM6mfuqPrbzcnu/1Jx4nwMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uh9Snzvo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0F606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uh9Snzvo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB8A1F000CF;
	Tue, 24 Nov 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532468;
	bh=rSwblT0wDnKcCiXOu3brWaFUlsVqCMVE+zVB8mUsu7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uh9SnzvoRiDR7/ClZn333tzNu4AWAPxQPk4g37PaAMhhnJePKxfgK6svTF/Y0BtjE
	 v8DrlygbMGuIS5iabsK0v6SFE48r/+x2Q7BiZi9RsgNSwNVI+VXjHGfT0GBIf/SLV3
	 08UT/BTQ8VTQVacTrwGprhcgYLV1hOxdR4yeUzMb7T0WXqPrl6F9pfDqr7uWmgLJLm
	 C9pksbnhyX9xWHZAFyicrMYBKnpPm+pQYgAQC2tY4g20C1IS4d3Ktl4Sb7ztclqhmR
	 pE1J0HWbxxINodBrTiq6IFXEjq9oafRrbdha9SG+mdRUIDPm5WhauJ5wwZrbaKifaW
	 2dkP9LypadY5w==
Date: Tue, 24 Nov 2026 15:01:03 +0000
From: Simon Horman <horms@kernel.org>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	Rui Salvaterra <rsalvaterra@gmail.com>
Subject: Re: [PATCH net v3 1/3] tg3: Don't fail probe if 31-bit coherent DMA
 mask is unsupported
Message-ID: <20261124150103.GN31322@horms.kernel.org>
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
 <20261118105408.1076095-2-pavan.chebbi@broadcom.com>
 <20261124114338.GK31322@horms.kernel.org>
 <CALs4sv18PR8cvyV-NN-M3HA7S6dQJeSa-L2TRevEO3RR3ZkBiA@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs4sv18PR8cvyV-NN-M3HA7S6dQJeSa-L2TRevEO3RR3ZkBiA@mail.gmail.com>

On Tue, Nov 24, 2026 at 06:18:05PM +0530, Pavan Chebbi wrote:
> On Tue, Nov 24, 2026 at 5:13 PM Simon Horman <horms@kernel.org> wrote:
> >
> > On Wed, Nov 18, 2026 at 04:24:06PM +0530, Pavan Chebbi wrote:
> > > Commit 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for
> > > BCM57766 chipsets") lowered the coherent DMA mask to 31 bits as a
> > > workaround for a spurious address overflow error in the hardware.
> > > The result of dma_set_coherent_mask() is fatal to probe, so on
> > > platforms that cannot satisfy such a mask the device fails to probe:
> > >
> > >   tg3 0000:01:00.0: Unable to obtain 64 bit DMA for consistent allocations
> > >   tg3 0000:01:00.0: probe with driver tg3 failed with error -5
> > >
> > > This was reported on a Mac mini (Macmini6,2, BCM57766) running a
> > > kernel built without CONFIG_ZONE_DMA and with IOMMU passthrough as
> > > the default. Without CONFIG_ZONE_DMA, dma_direct_supported() only
> > > accepts a mask narrower than 32 bits if it covers the highest
> > > physical memory address, so with direct mapping a 31-bit coherent
> > > mask is rejected whenever memory extends above 2GB.
> > >
> > > Treat the 31-bit mask as best effort.  If it is refused, warn and fall
> > > back to the mask used before 614f4d166eee, so that the device still
> > > probes.  Platforms that accept the mask are unaffected.  Where it is
> > > refused, 614f4d166eee never protected the device, it only stopped it
> > > from probing, so this restores the behaviour of kernels before that
> > > commit.  Warn when a status block lands at an address matching the
> > > pattern described in 614f4d166eee, so that a resulting TX timeout can
> > > be identified.
> >
> > Hi Pavan,
> >
> > I am not following how a BCM57766 device can be used on a system that
> > rejects a 31-bit mask. Is the idea that TX timeouts are infrequent
> > and can be lived with in such an environment?
> >
> 
> Hi Simon, thanks for the review.  The report comes from a late-2012 Mac mini
> (Macmini6.2) with a BCM57766.  Its NIC worked until 614f4d166eee made the
> 31-bit coherent mask change, which that machine does not accept, so probe has
> failed there since.
> 
> To your question, yes,  I think it can be lived with.  The erratum is
> triggered only
> when the status block lands at a specific address, and if it does, the
> driver's reset
> logic kicks in and the warning points to the cause.  That is better
> than the device
> not probing at all.  Platforms that accept the mask are unaffected.

Hi Pravan,

Thanks for the clarification. I agree this is a reasonable trade-off.

Reviewed-by: Simon Horman <horms@kernel.org>


