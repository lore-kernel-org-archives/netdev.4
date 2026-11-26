Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686161;
	b=JkafTZZrp55oPWRNsblgdxlS0szculGLzrhhgczyoI1tg30TOlAmWCnIL6WkVTiIrrSd
	 h3V0tV0ZtRadpRSXpbK4/T9qAiD0YEZqL1MSkaD/Hdo0uCcchl1HKpjypiEwOYrHBgIbq
	 P8vNxYKS+LiuH6/zGlur5RIVCZS8jIHG36iLQdQvA+54cQzUyx7RBwUpBdWYUdqLHIzXa
	 PsqK0R4O1GwIzVN7MP7ga4k6i0DlGjstyEsHMDtqiY1dkW1gIloODTF8Xerxgxr+IUVHc
	 avQCCSNva45+WA4ouCu5BWKvP+dWh5Z6Cq/N3oPmQTDc20SX57i/BPf5GCJwXetlEoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686161;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=M/wB2tphts30fLKOq0Z1C/sm9lSylLoSa8qPouxPxvHlyYhiveK4PwoWMmPMqVEy+3bU
	 qwqTRbZXItvEBKk/JdOpSfcrWuRKjxXdIawrCIQ8fgEevQp2GrdxJrgeR+IjdW3XXn6Xo
	 Xlt1+QGzgEX+5m7bq+AY1+AudMiTSFeKnpo+lInTDYbZs4RZySKU8IfPAzBGx8/Z7lr75
	 6w7U1XVDv0Md4mtKIJuXS6jABlg+IiOIY3wsF2QvOCUiEAycD/BMRl155JW+hzmDKWfge
	 pNPzNexAsU5Anl+CSfY77XEgB60yXCTxWkl51q2W6PaRYHVt6mWdKQzZme8/nja5Jog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpDG1WLy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FF606A31C;
	Thu, 26 Nov 2026 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpDG1WLy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620641F000C4;
	Thu, 26 Nov 2026 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686160;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hpDG1WLyNFQlJO5gPD/ndX7WNfGXSZvBRoiUJtHX1gA34X1uShA1vCJ1gWWKL2nQ5
	 32JyUqjy5ZJp0JmFQsEEiQPH0APAUtY3hEmf2fESgBT/ky8QSxMuvaaCFctykyMG4B
	 9itfdkVTpF8H3bMcbudvjKAs/CMjsSmrXwsKL/z2rKRhlBkC1R3tcI9Uue2m7zsNgZ
	 pbZFX3GsGgd46iuOHK/SX33c3VCu61VprNgkRcEYfe6RFh0WBpzmyPeXfoAdqcollY
	 3VXofy2Fif+6pjl/NJx4MNrPK2g5oW6X9AETPIQQCjlJvqDlCcAcKap9ISzW0xlURE
	 NX0ElOXrGixjQ==
From: netdev-bot+sinfo@kernel.org
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] fsl/fman: Drop device references when
 dpaa_eth_add_device() fails
Date: Thu, 26 Nov 2026 09:42:39 +0000
Message-ID: <179568615995.3294.18215982267016488454@kernel.org>
In-Reply-To: <rc-b1-20261110-vc-177-85d2478ac4b9@gmail.com>
References: <rc-b1-20261110-vc-177-85d2478ac4b9@gmail.com>
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
