Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610070;
	b=X/IpWAovIG+dsuHRu5nSH5f6WcIWwnT+0jWDIymN2SYTpYfIHTtyDl6gdhhxnEXsN6x3
	 +5oGuBK3/Vh4WZ2/ob/o3C6CWavhYJ0GOqQoCgO3+XRC8Qj+bDh3lCEPgZzOjEPrd0hIZ
	 mn09LeZdbrYVfNmC71s9NYHGnd+MqIPTPd8fOAtymfroyFROxW4QneMsDoeJ7BQDqF2BL
	 FvmGMT2rTcVogyp65V4nLWdZmFEjur6Ze/ZoqInSlinKfNt2OtAYww8/Ag1ZHKDkCpNEn
	 4swg0b0zy84w9oTQK0Lxk2TxybBwCqULZHxbKcSm4oqhizhonHGsKt7JOWH2BTyL5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610070;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CfhMFAUFDbWoJRBmu9tGLqNA4W0g6TELIvWPuiErhDw=;
	b=Z1MFN7qjH/yXBVRP9AB7vf2jkhxo2KyTGXEl9DKRuKPFN/kKYCZnN82FhebWdH8xGaMW
	 UkHTumM0jfMDBeE25cdl+mfdt4U+8vEGvuEJskwFZTEhCXlO34Qf54xGbsP77fS2K+2zt
	 QqR1BOJsA7Pn42wAtYjOkS69MyuDJr7XQTosKYsn7YI8C+8/5D5vRb6aiWta3z69/tf8V
	 EfwnEpEymzPSl71BQtg3Ch/BXWbPA4iyBWElm2oLCnXSkwDo0WWjwrxAfxghjSBN5LBOp
	 DFeedkQFrHCU6ZlGYZIt9zCRMd7DbFMDLmyQoX2qr+6LDcrALO1sD/irGP/1bSsLzKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhbHDnhq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA12606A31E;
	Wed, 25 Nov 2026 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhbHDnhq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827661F000CA;
	Wed, 25 Nov 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610069;
	bh=CfhMFAUFDbWoJRBmu9tGLqNA4W0g6TELIvWPuiErhDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FhbHDnhqjlmTdrbOe4QuxzTLaw1MsJz3P8U6qGwC1ppFUHnccHP1rMaycukB59UUJ
	 u6Al4a3QABCe/6OoKosBrLsNLwnVVZHRzw4w/E0+9+ziLPcSZee/T6YIeRXrCxhtFl
	 iIg4QPG7ToM1dPCvTOD5upnFKnOZ3MsULBZd+jDCeCIkU2P5BKCZYfvwg79+hkTDG3
	 KebcoDbizyl8NFHbmipPM72oYQNBjEHAD28v7H9XRl5YDZfmWMr4qQRsM3N6kY6aPd
	 0Ar4sSigUObzPLXZ43isDpGfBmGVMOtSJiv3jtbgjqhoWMlR30XrHznNNsHpKArYm4
	 z1LSWB5F9fOSg==
Date: Wed, 25 Nov 2026 20:14:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
Message-ID: <awbREK0TPUBmw97d@xhacker>
References: <20261124150144.7505-1-jszhang@kernel.org>
 <179553409391.3294.4369903743102583251@kernel.org>
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
In-Reply-To: <179553409391.3294.4369903743102583251@kernel.org>

On Tue, Nov 24, 2026 at 03:28:13PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

hit during development

> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

actually triggered

> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

synaptics SL2619-RDK board. However, every dwmac users could see
this issue in theory.

> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
