Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292520;
	b=Jou8oVMZscvHLXS15YGQHH5aefuZqbgFbLC5qdReKm5PI76xztNCaRa3V3lW0lb2ux+E
	 UaXaPcESi4vRlQzEpWPD44dI7LbnZYL6jW6GNvsl3bYCg6zbZMluabI+p0BE+ZBhjnu0U
	 /Gir2Tb0hDYvDfE1Qi0rjeR3lPICkVv47qosM2qgO6VQbtJ1Kayzp4dx7tx7hJP1YZfkB
	 V7X2guTAlkMXc4+2TKhGcYcM4NDmm+iZ0EVSs6E5uNh7Ebu082PYldowuJ3DKjm+vK74E
	 1Vh3lq2z87TFTxj0Gcnijp5RAUFPBun2WoXup6SWoHWKsWj6czBPqJbjQGPamh1IPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292520;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AHUQMxgVMnTXxKbmEWmbNVYVHdBgjW37+wv9A15XjEA=;
	b=uu96Vvnt9RYGEVbuCLvozna+rQABq8bs6tD3QEXd+Iy0Xxgd687paVEp7XkPlVyxvVDh
	 K/8uZe7l8ZUo+r5jHNDhoX8emWQpzM+ULe8z148XxeuP0aF1oiq23Qkr7FYXOH5H702Zf
	 QiJaKg60fT52bIe9xIT1c04QdRN8zVQ6lDLf9FGGRSSF6BG36/TaXJ8z6LGN/fepybXQr
	 5ChCqwCKCCYJ3A6Txe3QilAHU8cW8DCwgKHjhOk1YwDWXd31F3C3MrKd/ID4iVJJXkvcJ
	 +bwNuBax5K0eXjnyK3WGYbLyG239IeGa/sBulPk5dz50sws5C2CItAR7VwLNiolSBZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2FuDmHU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82F606A320;
	Sat, 21 Nov 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2FuDmHU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF041F000C0;
	Sat, 21 Nov 2026 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795292520;
	bh=AHUQMxgVMnTXxKbmEWmbNVYVHdBgjW37+wv9A15XjEA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W2FuDmHUppm5SPhv9G08NORlp7OkTi/kNvsUtOkx6P0tjFmnH63ZM7hfnlR29q+Gl
	 LxbSs34ywhFlbB3wCS9gqyYsJo03tPku2kV3YTzA3/h8dz/DYi4s4m8eQN9NakQ7kO
	 cuu7d/VVWPqOEiHpMDigzvDGKXKW2OrTT5tekoBjkINl/OHLfEeHm8qGq9lBVxNxY6
	 q1lldf3d7or+ng9Wzf3Blt/lGriTCIleeLonaZKFL60xZYbr1ZEU8a40rPqAZXceRe
	 kaxCnps21folpZ+nIByCksYl8EFwVwQ1ZPJfcqNGj/7coMbSoNTgNIoHyASCpzsylh
	 h7MUsdCIwj+Nw==
Subject: Re: [PATCH net-next v7 1/3] net: ethernet: mtk_eth_soc: fix the RX
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 20:21:58 +0000
Message-ID: <179529251869.3135.16945484998995426880@kernel.org>
In-Reply-To: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
References: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
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

- [Low] The patch subject "net: ethernet: mtk_eth_soc: fix the RX" does
  not say what is being fixed and reads like a cut-off sentence.

--

net: ethernet: mtk_eth_soc: fix the RX

This commit resets dma_addr to DMA_MAPPING_ERROR at the start of every
iteration of the mtk_poll_rx() loop. Before this change, a descriptor
that took the release_desc path without a new mapping could be re-armed
with high address bits left over from the previous descriptor. On
MTK_36BIT_DMA SoCs with DRAM above 4 GiB, the hardware would then DMA
to the wrong address.

> net: ethernet: mtk_eth_soc: fix the RX

[Severity: Low]
This isn't a bug, but the subject doesn't say what is being fixed. It
also reads like a sentence that was cut off.

The body describes a specific defect. In mtk_poll_rx(), dma_addr
carries over from the previous loop iteration. A descriptor can reach
release_desc without a new buffer being mapped:

  - no netdev for the source port
  - MTK_RESETTING is set
  - the refill allocation or mapping fails

In those cases rxd2 gets the previous descriptor's high address bits,
while rxd1 still holds the current descriptor's low bits.

None of this shows up in the shortlog, and stable and patchwork tooling
rely on the shortlog. Could the subject be made more descriptive, for
example:

  net: ethernet: mtk_eth_soc: reset RX dma_addr for every descriptor

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-7d2c457e68de6b53b7348d1bdbeadcec%40loljews.com
