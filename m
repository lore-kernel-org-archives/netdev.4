Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011133;
	b=FI1973yQgWtg+xt9/QuBNci9cdAOI00BPhd4Tzj3L7Hmlq6ETXEWk32mSVhThMAc5epy
	 o1MpIlgN1LGsDVVyygg+syVFi3NcYQ8EE1+G1Znit6pu+mKe1Q/4s4VVLyeCR4STUvGnc
	 Kc6YdVNWiKzT7hGNhvX21INXSpfY3gyay/ENuvfFfhClkpO8gUautuPCo6gXT4n4nnXm5
	 UWCYuxydJE63YpRyVHEseJAarujoE53ZHptTrBTwR8JbDHCos0fSE+nsstdbpS4WBg/Qc
	 7clMAsewiBWk1lKp1CHLf18if7hrnaBge5bZdVLAQkEbNNvPUNYk4rRwmT8xDxv1Diw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
	b=afaO0ToyDr85AjFTIr+xUCR7yIZgReNLVyERLKEiLgislp1w6ECtHIKCw4lwy2ic2rPh
	 A+pnKjlP6+XK4TgAu4ktQ2MlsALp93xpBFItRjBOjMq+LSCJqMMYTctY3dI4jkUIFj18P
	 fUkU0UzZgvPazAYbxjKzIyXy4Qyo5QcOOOH3zN2qcEAo0X7/iBrsLI+w0UJCW+2dnMoJD
	 B+WPidx53W2RbmyddUKB2HZV9UT1PGLf16SW6vN7q7AkD2Cjb7V45qfys6FgBx8sPCdhy
	 wsIwLPS0qrvotGx9ZvybYVcAc6n0zK0zip+CCdetoLCupSJia1p5oXiMsd+FPgTi7Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0760A2616
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C0760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so381292f8f.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795011126; x=1795615926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=X+Du2E5HeDdGwpJtkkybS4mRnYIN76epeyKOe0BAKNzk2aIzSHPLlFW1sPj87xh6QD
         r8+27iMo40fH3/Dfjz/gjFCrVzVzwYvkUZD9TFz9bTM2Tc3FHcMsL2SxK0ysirMwspZ6
         bFZaHoYqXkDu1jjng6iK63CdgKssDdTzOvbzGkeu4BC33Kqb/OL0JZe3/FnqX3w7/Q09
         CoxzHRaFuCZM5DNQ+HEpaMLG+idiYekrYrYyjwysV7ldZqI8eqFfS9p9yDN77C27r4nd
         aQWcGYi1pHhF3PATB+2bvKGeW6ek3lSjSwjVlq1jIHKFJ/2km/fmms3HIkfrJRTOi6Bb
         ot/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011126; x=1795615926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=PGLlPbOUWoR0ik/vdBGjTkf4Y4l5fcPtO4oAw0k3gj6QxB7SDCgGEYUyqS4g/WWRVb
         2MQ38d7dZqlpPLHjgct34CVH5SaNwz24UuuYgXhT3U9tX53zqfNyPu3r0cMv70j+kWTx
         asXsxyIwHSQYqE3bxs7+rRewr3DEAKay1nM6zRnvob0mTd2AUsAyTy0GAzvrRt4lg1im
         1lvaGsm1qYZvw/kUKA6+Dj65p1KGmvlsRuWEDIRHgjrbx3l5Qf5XFBiIXA7osBd0rM2n
         w36hVjjbVnrF/YRmMEwhPqfDOeM5xTdPJlORpF5F8vqP5w/IXqbEQj5lpt0EdxyghASq
         VYRw==
X-Forwarded-Encrypted: i=1; AL+hErEvcA4NV0pgsQtbU4apbAWVVtXBE/GrK0IeZqSECmBN4n/NsadV+tVdjlrwilR/jHfmT2waBoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c4rMMiImEL6L/PoaLASF5IOibRjsZAtAi4kcpd+szvYFiR2Qy
	poOHcrLKx15KsuDLwpZAg/pn3kUMo01tjhoN5YIGNS4UHEx9qqDVA+Gt5BtTcbjrXv+eHvTQM2u
	n84H6
X-Gm-Gg: AZFdTZcqHWwKIddBSoBSA7SQRSB31FZyDP0Zj3bmqFml53R+yKSSQVP6D0xr0hMxRej
	7FcuhAEVFnd7WRZTWlaRrQH31je619LKCcYAbbJPb1U0SKt583ciqY1U9fI4R55jqMp1ctrTmI5
	sQD7SXo4iDDv7y8XbuTXhFb9BPP32ynXjNHLrF4KPKIYOW+O4cK52mTpbl7J8svojNhuJFNcWtX
	xItopMtqOYGJYxVlqtn/rwmFnLpsg3RmDiOTlpPddH/4dlYzWtXQkPdJcncDZ6mPsvUSufEzo1R
	EussLtUnP7/WyFtc4M5sSYUuYM27Fp/dUO2Mr20H9v37xKNsvgcdl1JLFONtdMnycrrNMm+TfCO
	pZYKWOdr09WDt/q7n0hTIDOhbCGGLgam8Kb7CcbsK0wrbES2chFx/iEdtuQJ5FroW2zPhor6NYz
	aOf1+LOuyd3vW5fSmXlJ9UVB7uzQZ9E8ZIpzG0PbGhZF++YIcQo9UdawsnreB50icU4qfWGfQPA
	q0XbQRy0r5JHByCAdr/r9oWngmOwsWqr3hmztBbfbbTtL6pBWulMw7kWn/cI5QT2RFbMr/GiZ4S
	gKeiaVIYa+M27TnZEzfrKG/tcPC6XMxLnfmpNnYkEB4o+lam
X-Received: by 2002:a05:6000:186b:b0:48e:88e2:fe6a with SMTP id ffacd0b85a97d-4a63f4623d2mr6222883f8f.49.1795011126108;
        Wed, 18 Nov 2026 06:12:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm5590663f8f.8.2026.11.18.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:12:05 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Fei Chen <chenfei@ultrarisc.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
Date: Wed, 18 Nov 2026 15:12:02 +0100
Message-Id: <179501112283.639563.5233054429317576626.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vlDn3aALOXByZVs7mEqRvuJC3A1ctnxY975yMiaHYv8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/N5nknC99zPPvkMAeEz+LJ/rb3O42SObtqLnBOZNhY
 rKGh3pmRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyv5rhf+pRtSNHwkU+xf62
 3H1MSnpnB/t0htMrxT57Xp29uUlbppLhf/BEnSWNU72uGOXvU9VP+/jowUV9g7UhNjMfXXfY/J3
 3GgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
> maintaining its drivers. Jia's listed company email address is
> no longer available.
> 
> Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
> for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
> Xincheng Zhang from the PCIe maintainer entry.
> 
> Having two maintainers provides continuity for maintenance and
> patch review when either maintainer is unavailable, as suggested
> by Conor Dooley during the UltraRISC maintenance handover.
> 
> Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@spud/
> 
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
> ---
> Hi all,
> 
> Jia Wang and Xincheng Zhang have left UltraRISC and no longer
> maintain these drivers. Jia's listed company email address is
> no longer available.

Maintenance is not necessarily tied to an employer.
It would be better if the people removed could Ack the change, and let
the community know they don't plan on being involved anymore.

If they do not reply within a reasonable timeframe (a cycle maybe?) I guess
you can remove them anyway.

That does not prevent you from adding yourself in the meantime.

I suppose this would go through a starfive/riscv tree ?

For the clock:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

