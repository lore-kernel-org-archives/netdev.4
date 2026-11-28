Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860570;
	b=KIYWpr+plTqmVRgaW/XSEpdvqCkP0RnfYkHDygispObCAG2BhSK59LsdJIilfovrzaJr
	 uFIF2IgG4ZVtyUCQpgwk5JLY/pKnFEy+yHW9x2wF92jEa2aFKENL9DO/bKaDHGb73tWVj
	 95jklzxajzygA36qdiGWTIciAmPKTKxsVMG8zdPgofE+gAt9dRgvrxCORTB/kuHQTFueB
	 qOsBuzs4n0R0ZUZxRtzbPIDS6T5apE4tCcuBQqrVe06TyU+Y/HgSuQF0YjdBbadQMmsl+
	 b1CzmIafJIAyiq3hrc6hzXeSJGeSDtop3Xy3GBBv3h94Cp8lJ2FqsKDBusuxcPbRRZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860570;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=QyFZvNmUQCsZ4KjkTBCVXBe2GZZZuCbTI0eny2+sTy/aCEaa2Qb6JpjR2wIWLLD4UWoy
	 PDpRsHB8djTd7dWFtpmzYihywAW+x2VG1ZSoOgkYxbN2tA+WcGyhak+nk1ll/jJjHgjrd
	 Eq7gNPj9xxZVcoM4WiTtGCuQpKUCCD/6+JzK+mfToYn2Yx3jS86FI0dVFTqVe3NSXMyCz
	 XcL/ij1pyK0FSmKpmp6KnHOa0XhW8SCNVrhcJgblNXfb+NIOzpGLTe/y18+X/B6rUglDL
	 xYBH7bM9bMqwJ+mRk54ND9RE+lMalaGr80asG1Fd5rzEi0/sdr5r2er3X3csIa14qUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhxKr1jV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9718606A31C;
	Sat, 28 Nov 2026 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhxKr1jV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB3C1F00893;
	Sat, 28 Nov 2026 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795860570;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MhxKr1jVcXYxNcwYrOEUlmDHQM0Q/c1w0n+igHUxOyTDgVEHwpAuVxBjzmDV4d+P0
	 2ESt4bPzdw40TJvwH/nSW9EDr6VyHo2c5IqWoLg6aexPmB7gAWJzKuYV1M322Jpn6z
	 wB6X7vRg/l5rO2BwVygdJfQK9PK21Ive20hY6tzKa/oKCTOyPgbx6CRXQcozmcfYL4
	 O7/Rb0TTxuvP4xIWDUFIg0hzGLbc9ggIJBMPgwqm7Yp5scQQYUO/FA3j0kmVKDho1K
	 Ai5YpTGz3MVxTyH3wcu8LeId4gxN0Wx+cL35AP+jgVaDMvfnwPBTht0wzANs+iAx6Y
	 WNmTc7JBpRTEg==
From: netdev-bot+sinfo@kernel.org
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net] net: pse-pd: tps23881: fix the disconnect event decode
Date: Sat, 28 Nov 2026 10:09:29 +0000
Message-ID: <179586056937.3294.14660533366618098643@kernel.org>
In-Reply-To: <20261128100648.3237097-1-github@szelinsky.de>
References: <20261128100648.3237097-1-github@szelinsky.de>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
