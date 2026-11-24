Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524730;
	b=5dxXFaxYEsfZRHDGzdaUhJI0Gn9dZWQlSRzEdIO3w3lbdw9R3dB4OXDBeZZiShbKdips
	 VYBjXTHGfcpXSEeuXdgcUoVS2aiy8VRzcEc78NoG7yEMaB2lg6N64kvTgbWBQdQfnk3G9
	 EEvMlOrZPlKvfEzwv18YogvEfiEzkdxfY/q7BJbxM1H7KTF5vuAAJFXFd1TVazwtvQydj
	 1f4x/M6nxih8o5wzhstoVF0kBaUZFrryGX9xPhHv3qkyT0c0gcrOIts7ErNCGqDa2HvgS
	 dCz7rRfXbHOlZh0VAgCZr4xoR862CANLtQ5gKIgBVIe9NlDf2g1/+AvNYws/JhA04Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524730;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=IAWVTlA6E2meeTcv9CU9vzD16WjxmX7/TNt1eWIUr9yLBuFzRZC6tMgUFCAc2XFnK0TT
	 30Z19BcN7zDCHIgU474nrVdHxgN7EET3+DIEmd/R8BUqhmHLuuVFutNvmhLPhO6QzmZ42
	 7sliqugSZquWziv3z4umH/BfLm2e1DFEjJOLuk83I+KKcUcybxpMx1A9ejbxxlZ0T6b0d
	 F+PZQkWbtqfaOeAgRUMqsjxcR9brYO9jY1nC2guX1tIPpN/ntU1lTdrCEq+bZV/92TWq9
	 HD1tVw4G31JfSNBjhRJ/hnoFcQ10ySma81T0xmCXo/QmAydSXJ0zqTsCzm0TvKEus6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXZhgNOa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7245A606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXZhgNOa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB741F000C0;
	Tue, 24 Nov 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795524729;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WXZhgNOawzvodrqM3cMFCs15o5d0wE9BPswDDQUSamlPgGLTdOc9NBK8DfERI9rQn
	 ZptAMeGAkWSoD9ffv9l0IZ7qDFQw4I3k+56/iLk4SXEMggZsWYO2fy2uvZdqKLwb0+
	 TplATzVredqFzUzLQWBweEcCY4lPNsZpJJD3A1/QEkf5D5wQBbkKEYhJeAUNboS30M
	 8LrwF720FG+no5nSqKYshx3ReiRcLzH5/Zc65j+9+Yjf2ucUTZoi9Ta6gV0MLcjNEz
	 tDLBz5XAMIBCS0KerzEnRUw3g2xrieCSn/pg/uGPv4yT8FTm0T49bjagpPkchaAnbk
	 YxzoKHthnDThQ==
From: netdev-bot+sinfo@kernel.org
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next RESEND v4 0/4] net: microchip_t1s: fix collision
 detection on PLCA status change
Date: Tue, 24 Nov 2026 12:52:08 +0000
Message-ID: <179552472884.3294.954572451733299111@kernel.org>
In-Reply-To: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
