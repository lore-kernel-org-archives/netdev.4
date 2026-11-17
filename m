Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950060;
	b=g3ljN3fDQv6ZMZpYV9LXVZmfl6Z5E9WX5wMWf9t3AJArgtcbTMZREE0IWIc8kvJ0oxyT
	 oaeancWVRzcx/YOZxfNV9qOoRYzUrdGW0y0OjH2N+PFtQqrs90W07gEKDqIhZbvnIPdO5
	 7+fE6VB/jj6SSWer9yWTLMqbeosZfGphRbNEK/3yNO71p6q0VOwNJpzLAB0p5/4j/5CIf
	 VZ4XX1vPdqKbCrqkW8lBx07Jax4OA4ZRkCRU88WFC3b6jSOeoVd06/f6fde+YmD+O9zET
	 f0Eqvc8CjwtBh0Yjx2zXr74QGoY+ltiET7+woviW5lqRzVcMjP82e9Akgvgz0OEtHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950060;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5Jy6I9xwSznDCu2tslDwfAlzq1mfSFUF22hHQNHG4cU=;
	b=sCXFrKy569ZQL6A6Op8TRew3JsFUMl2wXp4e8PkcoUgzL/tq27XHfUVuv0JrtNcZXhFv
	 FjLYGF6h6IoX+WwcGYNlw1onbJxariFvqecYgY6+vc8D1ql9H5y9Pysz6VOfdeKW02S9h
	 a3KayBKuPwgwCir9QAfrxe9O/TeMxbxpXXQtCLO1Nbs15wil69/UZdKNqIOjeQcibasVS
	 Fbh3BLAhzSQkXxWcJMYgOIfso8MDB151a/OEntk8nrrocNghWmBf0hzYf2uFjsivSlHcb
	 YlRBg22rwbpEhYmBf5HYnx56UQXmxrhM44OV1a/UjneWKQhJo+7mOoblxGXhb9ecOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBM1xLe8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3327B606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBM1xLe8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD3E1F000C5;
	Tue, 17 Nov 2026 21:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950059;
	bh=5Jy6I9xwSznDCu2tslDwfAlzq1mfSFUF22hHQNHG4cU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PBM1xLe8gHkojJhzUT2GgnaraTd/em2Ce8qeDkSm5Zkd9rIHr25ST1syirwcx8MnF
	 eCk5AvYyINhVvzGWi90B5xq00SCZ1phPmK732opGHR55c7WgoFUTsK1PfeqfJsJYFm
	 p6Pi23FnwOC2ThRPo3EqWd5ZH+2S675jzFbFSHBse10cgcKhFMkNkrHgW+kp/RwiUY
	 oKA4pPfoOU1kYBEvxDG2hfTsMOORRw1jXb2WRf/Y8C48s1kEmyuRXAFaaiqPjVREPm
	 cAFaNE+PQAvgs9k7fQJE458uNlPAGzQ/Ik1K/uvYe/c0TXA0M0IpvuErFAHBtMhduX
	 8O38mQ4boABEA==
Subject: Re: [net PATCH 1/6] fbnic: Wait for in-flight PTP timestamps before
 treating Tx as idle
From: netdev-bot+sashiko@kernel.org
To: alexander.duyck@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org,
 pabeni@redhat.com
Date: Tue, 17 Nov 2026 21:14:18 +0000
Message-ID: <179495005876.3136.9616798412841778832@kernel.org>
In-Reply-To: <179460248693.8819.282933709034208845.stgit@ahduyck-xeon-server.home.arpa>
References: <179460248693.8819.282933709034208845.stgit@ahduyck-xeon-server.home.arpa>
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

- [Medium] The new comment above FBNIC_IDLE_POLL_US, and the commit
  message, say a 20us delay keeps the PCIe reads 'a small part of each…

--

fbnic: Wait for in-flight PTP timestamps before treating Tx as idle

This patch moves the Tx idle wait into its own function,
fbnic_wait_tx_idle(). The Tx path now counts as idle only when the
QM idle registers report idle and FBNIC_TCE_PTP_INFLIGHT reads zero.
The patch also raises the poll delay from 2us to 20us and extends
FBNIC_CSR_END_TCE so the ethtool register dump covers the new register.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 07d4b2e923627..c75c5683b724e 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -2398,38 +2398,85 @@ static void fbnic_idle_dump(struct fbnic_dev *fbd,
>  				   fbnic_rd32(fbd, regs[i].reg_base + j));
>  }
>  
> -int fbnic_wait_all_queues_idle(struct fbnic_dev *fbd, bool may_fail)
> +/* The poll timeout only accounts for the delay between polls, not for
> + * the time spent in the poll itself, and each poll is a series of
> + * non-posted PCIe register reads that take on the order of a
> + * microsecond each. Space the polls out so that the reads stay a small
> + * part of each interval and the timeout stays close to wall time.
> + */
> +#define FBNIC_IDLE_POLL_US	20
> +#define FBNIC_IDLE_TIMEOUT_US	500000
> +
> +static bool fbnic_tx_idle(struct fbnic_dev *fbd,
> +			  const struct fbnic_idle_regs *regs,
> +			  unsigned int nregs)
> +{
> +	u32 inflight;
> +
> +	if (!fbnic_all_idle(fbd, regs, nregs))
> +		return false;
> +
> +	/* The QM idle bits do not cover the TMI completion path, so a
> +	 * timestamp request can still be waiting on its completion. The
> +	 * count is bounded by the timestamp requests the Tx path can hold,
> +	 * so all ones is a failed read, as for the idle bits, not a count.
> +	 */
> +	inflight = fbnic_rd32(fbd, FBNIC_TCE_PTP_INFLIGHT);

[Severity: Medium]
Does a 20us delay really keep the reads "a small part of each interval"
in the case this patch adds, where the QM registers are idle but
FBNIC_TCE_PTP_INFLIGHT is still non-zero?

In that state, every poll in fbnic_tx_idle() reads all 28 Tx QM idle
registers (8 TWQ + 8 TQS + 8 TDE + 4 TCQ) as all ones before it reads
FBNIC_TCE_PTP_INFLIGHT.

For each all-ones read, fbnic_rd32() does a second non-posted read:

drivers/net/ethernet/meta/fbnic/fbnic_pci.c:fbnic_rd32() {
    ...
	if (reg != FBNIC_MASTER_SPARE_0 && ~readl(csr + FBNIC_MASTER_SPARE_0))
		return value;
    ...
}

That makes about 57 reads per poll. At the comment's own figure of
about 1us per read, that is roughly 57us of reads against the 20us
delay, so the reads are about three quarters of each interval.

poll_timeout_us_atomic() only charges the delay against the timeout:

	if (__delay_us) {
		udelay(__delay_us);
		if (__timeout_us)
			__left_ns -= __delay_ns;
	}

So the 500000us timeout allows about 25000 polls of about 77us each.
That is roughly 1.9s per Tx wait rather than 500ms.

fbnic_wait_tx_idle() can run two of these waits, one before and one
after fbnic_tx_flush(), so about 3.9s. The Rx wait reads 12 registers,
24 reads per poll, so it adds about another 1.1s.

All of this is udelay() busy-waiting while the RTNL/netdev lock is held
in fbnic_down(), fbnic_set_ringparam() and fbnic_set_channels().

Could the delay be sized for the real per-poll read count? Another
option is to bound the wait by elapsed time, for example by reading
FBNIC_TCE_PTP_INFLIGHT first or using a ktime-based deadline. If the
code stays as it is, could the comment and the part of the commit
message saying "the 500ms timeout stays close to wall time" be updated?

> +
> +	return !inflight || !~inflight;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179460241885.8819.7179935130629202331.stgit%40ahduyck-xeon-server.home.arpa
