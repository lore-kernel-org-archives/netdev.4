Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442597;
	b=HL/E9WEHeJAKezeIiPxgpA5Q92dCPFDXvWjj44tNNLbj8lxjVMEopBgKf2I/zwMKodWI
	 E/dW75akNqFzPPY/uNa0y0vY01cFf97EJYJgkgCJFU/gJ9ext5jUEOed83IWYEx5D0ZSg
	 8lWk6s4WkcurAaPL1s2hDbCVShJdkshVJCaPqCZ0zMXDuGcNYGoNFXJsSAVmP3Ued1KRm
	 5/ttoXmW+Q3pBd0IvfGLUL6zxaIpbU3ns1u3ywI3er3pE80UX6Nsur/WNY9dmfqZ6dw9y
	 /ZvJTwXEGXT+edGigT8E5eGaJKqpHBj5EJcNSzHZhnsZJnt+BiNEA7B5IDahzNd318g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442597;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v84rwLUr25OsdKhfYlEQQtUOuFRbWdYS9QsBPOZ2Rew=;
	b=nRQiu4lYLkir1N1rgCRD0ofZgp8jzPzLvntBi079zydFNJB31OnsGUgnY0ZYT2NcA/aP
	 uykfMIHqXTE3k/DhgUydeELJPhIpSMk60zhYABUA6aGPvCcwSOkAZeU6ukvy/0k3h+l8B
	 7F7Hc/hIHVFvh1TUYZm4XBVbMZy+a461aXjnxMzeSQ/csB+KfAxt+6U7Vu2vOCY7G9QlU
	 hDKSfBR5KcZo7EA4gHYLb4szKiS6UTLUUJi/sxqNWm+pudvL4n+B1Vz/cqwF/b2DuKhk8
	 8WwFLVM03ssiwTWmVA1MEe0u6q9TeoRnOVEuorFDh10dqrzBue+HuSwNMH4TfFrEmIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDmtqeeu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57DF606A31A;
	Mon, 23 Nov 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDmtqeeu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA071F000D2;
	Mon, 23 Nov 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442596;
	bh=v84rwLUr25OsdKhfYlEQQtUOuFRbWdYS9QsBPOZ2Rew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDmtqeeuRE43Ga0cQ6xRV79FwlCK8D3B5eHPs+Jj2zzsnkjiqt4RzfH4809UHyIdL
	 cNsWjZtW8OWXJXcP2+fdkKMKU96baxL0w5t5eBYdTEgfE7r5wubZUnt5T5FQaBeqCA
	 1rFHGzeTGnSWzh6ClzkOT9IJZ7SGofit0IoQoMUDSvHiKCVwwLG3zmu/UGhcNN7wIU
	 /WFGljuVVoCHERBKl97YQnAQpYyJg34bXutSAyhw02Z+socydWJBw0fNDXW090uxWJ
	 Mc39edk8AXWxRLzI5geOYBsehacU5G/n6shRUp/4d86Dn/n314PFDJGi5p/4gxxCy3
	 biAuGUc3BRdMg==
Date: Mon, 23 Nov 2026 14:03:11 +0000
From: Simon Horman <horms@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	michal.simek@amd.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND net-next] net: xilinx: axienet: Derive RX frame
 length from residue in dmaengine path
Message-ID: <20261123140311.GB31322@horms.kernel.org>
References: <20261117060757.1767493-1-srinivas.neeli@amd.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117060757.1767493-1-srinivas.neeli@amd.com>

On Tue, Nov 17, 2026 at 11:37:57AM +0530, Srinivas Neeli wrote:
> The dmaengine RX path derived the received frame length from the descriptor
> APP metadata. That only works when the optional AXI4-Stream status/control
> interface is present, because the hardware populates the APP fields solely
> when that interface is enabled. On designs without it the length read back
> is invalid.
> 
> The AXI DMA engine already reports how many bytes it wrote into the buffer
> through the standard dmaengine residue mechanism. Compute the RX frame
> length as the posted buffer length minus result->residue, which is
> independent of the status/control interface and correct across all designs,
> including multi-descriptor frames where the residue is summed over the
> chain.
> 
> Drop the descriptor metadata lookup, which was only used for this purpose.
> Detect a failed transfer from dmaengine_result.result instead of the
> metadata pointer return value, and remove the now unused LEN_APP macro.
> 
> The transmit path is unaffected. It still passes APP metadata for checksum
> offload and derives its length from the skb.
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
> This patch was originally posted as part of the MCDMA series:
> https://lore.kernel.org/lkml/20260818174151.1608971-4-srinivas.neeli@amd.com
> 
> It is independent of the other patches in that series and uses
> existing AXI DMA residue reporting to calculate the RX frame length.
> Since it only modifies the AXI Ethernet driver, it is being submitted
> separately to net-next.
> 
> The previous standalone submission is available at:
> https://lore.kernel.org/lkml/20260929081316.803997-1-srinivas.neeli@amd.com/
> 
> I responded to the netdev bot feedback, but accidentally included
> the "pw-bot: cr" tag in my reply, marking the patch as Changes
> Requested. I am resending the patch for maintainer review.
> No code changes since the previous submission.

Hi Srinivas,

Unfortunately CI could not not apply this cleanly to net-next when submitted
using git am.  And CI stopped at that point.

Please rebase and resubmit.

-- 
pw-bot: cr
