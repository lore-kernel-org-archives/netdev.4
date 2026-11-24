Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526317;
	b=UMJw+3xXlep5RVAp4yFz7QNhgvaibX6hFt5tawggmYQb/RLP/NoqkRrtS+DCLGX82wAv
	 ELmFFsyuIhtMQh8sgHGGR81GFgAmQB/1j7hjMsDNVoaDRbd5Ii61tMWDAc9l5yz5P9PX/
	 fm472qz8SmBZXB8JEeMrYaJmfK6F2snSoBq83tGRsUKXjlAB4Uv9khVqsDHFveeOWgQr6
	 ThKwCLDkvf42EWzkQXQT/mTQihuipLWcqZFeeLdJV+gPZfcvFj5qBkNi6MQW5rfUvVnSs
	 XlMuvBo25h5vidaERlgGvNeElOZDwDibS1/N3dRRgD/0/FvhR1uZUv8AUuyMXUJzKtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526317;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ITS6G0VnKDuLYuuKatr6g2NkWvCt6BkFPf4zQE2wQcM=;
	b=QPpuhqasNXzSUAX+rY4AJZtTf5zQuTgqXPR2ye+RCsmMKR3EmEcpOs8p37qUC7N+guZQ
	 ogObq53wx5LQ4+bTL3z5nExxs4Klj7VgNH6lrFsm5+M7F7SsZE88fhmE/gxYmaYt8j08a
	 aw1nNkZWWa5GcLo4IC7dvFGhbPcL7vzTu1+dVx+Jhi6oqN18iZn9cAOWLrWps/6kRfQ3W
	 dqQV09gL4hyoFySbiB7YjGNgLkqL5Y5oRJ6v4Sw3SfIBWzznv94Z3w15bmAarXS47O7Qm
	 bbAewvkXZumyLmLwIQJEHHTMNyPMmy79IfNbUnOlkm94dNNmo2Tyi3oJdwcinXJycvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=ErYO21Xw;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9419606A32D;
	Tue, 24 Nov 2026 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9419606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=ErYO21Xw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795526315;
	bh=ITS6G0VnKDuLYuuKatr6g2NkWvCt6BkFPf4zQE2wQcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=ErYO21XwXrp2j56isJFU73eQzfIbySyDAIEqtC+D9ZF7r3b/N1eoniVYsEU4R4Ce7
	 dfKQcYOrStf1hZQvk5yajAONS7DtSNXOgDZzpo682I6XwQGRlrtSvgpRK/oDSsxlMG
	 lL+NrM91lG2hIUOWPJHQitmJIfGd3M4FC7wv4ITc9sP7s6rlW7aRHQ6vVz84bb7jDh
	 wVN/xV43p6AlL+7QznC74Ttd8KY7wOzSjl/fiPuHs3/dxfG98tIjIRX69FFV8M9o7m
	 KcL1WcZ+A9lSpplLq7+b5/Z87i0RMJaTMCn8Xz+Wnh0/x93L9eSZXmvTKbQz7FjwDY
	 MqmIs03yG/YgA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id EEC748D762; Tue, 24 Nov 2026 13:18:35 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: netdev-bot+sashiko@kernel.org
Cc: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Tue, 24 Nov 2026 10:18:05 -0300
Message-ID: <20261124131805.3303833-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179551786682.3135.159994678754691253@kernel.org>
References: <20261120102754.778283-3-magnusleatti@kernelriot.com> <179551786682.3135.159994678754691253@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 10:57:46AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Can wake become stale between rtnl_unlock() and stmmac_dvr_remove()?

Yes. unregister_netdev() takes RTNL, so I can't hold it across remove.
And power/wakeup doesn't take RTNL anyway. Worst case: someone disables
WoL *during* power-off and it stays armed.

> [Severity: Medium]
> What happens here on boards whose eFuse holds no MAC address?

I don't know, and I can't test it: my board has the eFuse programmed.
Probe already warns about the random MAC on those boards.

> [Severity: Low]
> Is it safe to change WOL_CTRL immediately after motorcomm_reset(), with no
> delay?
[...]
> On some boards that post-reset load might write WOL_CTRL, for example
> through an eFuse patch entry. Could it then overwrite WOL_CTRL_PKT_EN, so
> the device powers off with packet wake disabled?

That's a guess. The delay in probe is for the eFuse reads, and the
write sticks here: without that bit the chip doesn't wake, and it woke
9 of 9.

Magnus
