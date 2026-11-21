Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302176;
	b=3z7vcGlmPiqKHzgc9gU87QlkU6wlGGly2BDPFUtp9GNfOvGXAAv/c+K3DPGiLoQVUUyG
	 rvdSCnkHzgwSPIhOuXWGG659NTPb/ofH1DK4yRnkJAarC1dWeKSQaiiSB/tls0a6Ka123
	 HU/kkJn05hGxf+UvHAwHgfVPvzSiKh67NT+SMXNfMs9k9wQz96JHxJ+hZ0XyzBcq2dLH8
	 f2iLwY+aZgnja7nrwk06dln2GXOXYHCib6818MSHAx1VbIIV6gJGiqtrA09JBk0nPMs7o
	 VYhJsvPGtBimxd4DQ59EiuH6Gle8r2Z4DOvwRSZ4jfZTfWqoE1YubH2AgWLMEHBPaIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302176;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iFUv2lIek8geqEsLfyH9iDG/cs5MT6KhQ4IgQhPr934=;
	b=XhiWvWSMNvcBhWQeLDI+9/mY6aKx9H9GGDGxg6/B7/ZFwUn5oWknfII3r/TIMA/umR6W
	 PO6BsESmgcFGDnaYG1AnmjThQzhvqCG+6MR+mjy/vV6PvaQUuFO/z1nmY8kSbZO5T3fcb
	 xVAY9U1xQFAiDHDhuADAlgWsfQuMnR0n8anmbxlyQ16rHQi+0Jh6oVzfeQ8JMlwXSWsT3
	 apSK/Pzw/agvAGoL/giMYwpRouYTswTon9Qe7DKKSe+x1oZpYDY1B2Nzp2JonT9ddiDHm
	 mjMqcDXMIUbE+J1SfeaNgX+KgEBvoE4RUHKr/YSETrkOEXGh9BF90H1nmaBQhSaOpSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHTUg+gw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C21606A331;
	Sat, 21 Nov 2026 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHTUg+gw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FC11F000C6;
	Sat, 21 Nov 2026 23:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302176;
	bh=iFUv2lIek8geqEsLfyH9iDG/cs5MT6KhQ4IgQhPr934=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QHTUg+gwjVJ9RhOLpnk3xBkp2Nsog6f74hYFwCkptMXJswYZtEJwWDORU5FsfrutW
	 OhTjQA3CX3IaYFE+mRYo6FvDEF9rDBb7KeSY9ubxKj4oGhlFNy8dllF8zxGWnRwMDf
	 jwnYD+y8oQYwOArE8/Gp3dhBJXJEYLd2MjEz/8XuYgnzwWubJr+PfK7opph2tGDzDD
	 C0HPkrWecFiuKtCzHyF4F+EGCbTsltwLehECRxn8VZpqrfGD5ayW3UNQ5XWSGsfcVF
	 DpJ/nUUsFJ0OQWjw6jVyINr6qsse1WFuPTo6mAt6JdjDwQBsh7tTlH9EQcvhx1dahi
	 CgEqss/Kx8ZJw==
Subject: Re: [PATCH net-next v4 6/6] net: mvneta: serve the TX queues in
 weighted round robin
From: netdev-bot+sashiko@kernel.org
To: pepe.schlehofer@gmail.com
Cc: netdev@vger.kernel.org, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, w@1wt.eu, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 23:02:55 +0000
Message-ID: <179530217537.3135.2864178231067849132@kernel.org>
In-Reply-To: <20261118093012.90121-7-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-7-pepe.schlehofer@gmail.com>
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

- [Medium] Nothing in the driver confirms that the fix works on Armada
  370/XP.

--

net: mvneta: serve the TX queues in weighted round robin

This patch gives every TX queue the same WRR weight and clears the fixed
TX queue priority. It writes both the newer register set and the separate
version 1 arbiter registers listed for Armada 370/XP. While an mqprio
offload is active, fixed priority stays in place.

Link: https://github.com/openwrt/openwrt/issues/5411

> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index 89ade2ed7ce49..35409695d3d78 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -118,6 +118,7 @@
>  #define      MVNETA_HSGMII_SERDES_PROTO		 0x1107
>  #define MVNETA_TYPE_PRIO                         0x24bc
>  #define      MVNETA_FORCE_UNI                    BIT(21)
> +#define MVETH_TXQ_FIXED_PRIO_REG                 0x24dc
>  #define MVNETA_TXQ_CMD_1                         0x24e4
>  #define MVNETA_TXQ_CMD                           0x2448

[ ... ]

> @@ -1632,6 +1640,39 @@ static void mvneta_txq_max_tx_size_set(struct mvneta_port *pp, int max_tx_size)
>  	}
>  }
>  
> +static void mvneta_txq_wrr_weight(struct mvneta_port *pp, u32 reg, u32 weight)
> +{
> +	u32 val = mvreg_read(pp, reg);
> +
> +	val &= ~MVNETA_TXQ_WRR_WEIGHT_MASK;
> +	mvreg_write(pp, reg, val | weight);
> +}
> +
> +/* With the default fixed priority, a busy queue starves the others.
> + * The Armada 370 and XP manuals list separate registers for the
> + * version 1 arbiter, which runs without a shaper, so set both.
> + */
> +static void mvneta_txq_wrr_set(struct mvneta_port *pp, int max_tx_size)
> +{
> +	/* In units of 256 bytes, must exceed the largest packet */
> +	u32 weight = max_tx_size / 256 + 1;
> +	int queue;
> +
> +	for (queue = 0; queue < txq_number; queue++) {
> +		mvneta_txq_wrr_weight(pp, MVNETA_TXQ_WRR_ARB_REG(queue), weight);
> +		mvneta_txq_wrr_weight(pp, MVETH_TXQ_WRR_ARB_REG(queue), weight);
> +	}
> +}
> +
> +/* Only the traffic classes of an mqprio offload keep the fixed priority */
> +static void mvneta_txq_fixed_prio_set(struct mvneta_port *pp)
> +{
> +	u32 val = pp->txq_fixed_prio ? MVNETA_TXQ_FIXED_PRIO_ALL : 0;
> +
> +	mvreg_write(pp, MVNETA_TXQ_FIXED_PRIO_REG, val);
> +	mvreg_write(pp, MVETH_TXQ_FIXED_PRIO_REG, val);
> +}

[Severity: Medium]
Is the version 1 arbiter on Armada 370/XP actually running WRR when these
registers are written?

In the same legacy 0x24xx block, mvneta_defaults_set() writes 0 to the v1
TXQ command register:

drivers/net/ethernet/marvell/mvneta.c:mvneta_defaults_set() {
    ...
	/* Disable Legacy WRR, Disable EJP, Release from reset */
	mvreg_write(pp, MVNETA_TXQ_CMD_1, 0);
    ...
}

That runs from mvneta_init() and mvneta_resume(), and nothing in this
patch sets MVNETA_TXQ_CMD_1 again. When an mqprio setup has no shaper, or
when the offload is removed, mvneta_disable_per_queue_rate_limit() sets
MVNETA_TXQ_CMD1_BW_LIM_SEL_V1, which selects the v1 algorithm.

Suppose the "Legacy WRR" bit in MVNETA_TXQ_CMD_1 is what turns on WRR in
the v1 arbiter. On 370/XP, would the weights written to
MVETH_TXQ_WRR_ARB_REG() then be ignored? Clearing MVETH_TXQ_FIXED_PRIO_REG
would also leave the arbiter in a mode the driver never programs, and the
multi-flow TX starvation could still happen on those boards.

The 256-byte unit used for the v1 weight field seems to depend on the same
assumption.

The commit message says only the Armada 385 was tested, and on that SoC
the two register sets are the same registers. That test doesn't exercise
the separate v1 path. Could this be checked against the Armada 370/XP
functional spec, or tested on 370/XP hardware?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118093012.90121-1-pepe.schlehofer%40gmail.com
