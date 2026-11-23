Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393927;
	b=jprFW5mVg5CTlI7DgxBzv5+gBSh4b083EkoFNSE9DbK6cxvZHAZFjYFB2Fcfb3LOBtQj
	 Hr4RI6hfSAkvXG+cBYCy6Fm8shBkJ0cSpCbN/EjFN0r2jEQak9NC6i6mTxbX9+TEG7JTM
	 jVUOrlXB8QJ/ATcQXQcx2pp6DLwd0rRp5v/pwPYwxv9bLTb4yCPwcELgEQBxz7qkEahW+
	 HbVAZY5DmyqTY3MjH09Mcv/ztPz+Z6w1cY7VN0JWiT0NrLhebWhebOGPl8Fynm7w4FM50
	 5d6U31k986a/CtdKxA0WV6v8FzRgYyBUQnbCplZIlHtHvpqTTlst8QGl5UUu9pxZU7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393927;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vosa4QmuJd4Ix68iLJg+EIXeXcBTIsay77hDA6Bu0nE=;
	b=ZiSfc2zQYqMzwZq1WiSP/9pCinj3HUp87i0Fb2x8rNy2hXqXzT2BNXLheEHKh8jSOYPc
	 CBSQjmtjOdcZD6I1px5YLsS7UXHEg90uDzENuWqmPBWrJzxG2O3YKytjOedis0aczLqBp
	 z/Iz8QljlBYaYQ1M3RiXyc+5R2nJ/T4GtQhEEg0RUJ+7WmQRWOQ+ttD/E38DfEBO7Lmcd
	 RiRlmrnZTjctMTuhoZ6WC5c01nwwvVIQFQKtiHGdcpRqRYox6kX2s/aJCLBBzj2uRsMA4
	 Lf2aNkYPRRW+BF/5E2vuWseYS+vnOkyGE+Ofswfk0otI6oCXB4Y0d+42/F5Fh9OGPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQfatdW7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7E606A31A;
	Mon, 23 Nov 2026 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQfatdW7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19F81F000C4;
	Mon, 23 Nov 2026 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393926;
	bh=vosa4QmuJd4Ix68iLJg+EIXeXcBTIsay77hDA6Bu0nE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XQfatdW7oZzxBHdBlCEKPfS3cuBV9fdQKTC7qYzAE/y/5NaqIMK7bBKk/YasCUKyt
	 EBplFjEMCHrpf7F4DNUgfukSFmCm3mvjCIRBgAgzj5pLCNxHcxstzpBDkPjmd30bpx
	 GeORpY+9SAp+YfywJy02bo6jgu54Tji2srO+UmlkkHXFjKUlhQjg0WyI1nhJvUkFK4
	 WDx0Dd6ALtP0NutnJgiNJVm6IW+yeY0Bgrf17s9/huuF+3WszXw2O8EHelHNAf56/H
	 //tCv8eoowEdv+oisuuF7bQhTbO31qn1ytEzmygRB/IuMkirnihbriNnK5ZnTjK/Fs
	 qZxup5Am4FHKA==
Subject: Re: [PATCH net-next v3 1/6] net: add netif_rx_mode_schedule_update()
From: netdev-bot+sashiko@kernel.org
To: satishkh@cisco.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebaddel@cisco.com, aradhana@cisco.com,
 rfaucett@cisco.com
Date: Mon, 23 Nov 2026 00:32:05 +0000
Message-ID: <179539392528.3135.17519001770292308142@kernel.org>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-1-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-1-2cb25677aa8c@cisco.com>
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

- [Low] The concern: netif_rx_mode_schedule_update() is exported with
  EXPORT_SYMBOL_GPL and declared in include/linux/netdevice.h, but…

--

net: add netif_rx_mode_schedule_update()

This adds an exported helper that callers use to start a new receive-mode
update after a state transition. It cancels any pending retry timer and
resets the retry backoff, then queues an immediate update. Address-list
sync state is left as it is.

> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index b6f25e487984b..89ae77360a0bb 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -1568,6 +1568,27 @@ static void netif_rx_mode_queue(struct net_device *dev)
>  	__netdev_work_core_sched(dev, NETDEV_WORK_RX_MODE);
>  }
>  

[ ... ]

> +void netif_rx_mode_schedule_update(struct net_device *dev)
> +{
> +	might_sleep();
> +	netdev_assert_locked_ops_compat(dev);
> +	netif_rx_mode_cancel_retry(dev);
> +	netif_rx_mode_queue(dev);
> +}
> +EXPORT_SYMBOL_GPL(netif_rx_mode_schedule_update);

[Severity: Low]
This isn't a bug, but nothing in the tree calls
netif_rx_mode_schedule_update() at this commit. It is still exported
with EXPORT_SYMBOL_GPL and declared in include/linux/netdevice.h.

Later patches in the series add the callers in
drivers/net/ethernet/cisco/enic/enic_main.c:

  - the admin MAC notification
  - the V2 VF set-MAC path
  - the reopen in _enic_change_mtu()
  - the soft-reset reopen
  - the hang-reset reopen

enic can be built as a module, so the GPL export and the public
declaration both look right. The existing retry users in bnxt_init_chip()
and bnge are not converted, but the commit message does not say they
will be.

Would it be cleaner to fold this helper into the first enic patch that
uses it? Or could the commit message name the upcoming user, so the
export does not look orphaned when this patch is read on its own?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c%40cisco.com
