Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076275;
	b=vkq/Id8QDifS8AJj7rS03dOAQ87PvoPseyIsxFmBWti+L8rXIeC8bo+7lDmAkmyTEf3M
	 5I2D/DahEub+DKeeAR2Kh2X16kD+FmTZw6a9JvoXmJFWfTm7777IXD4SHIaybFqBVCve8
	 7B3DiJw2MeS/x0tAhiaYB1gj/gPcOJhNrqdJsGe86GHl6qP7gVTNW0Mtp9SLgeNhCMDxp
	 c5dSnCbifC+gxaL6/7bMpTDXWwiwuEJEOI4FjCHP2v5YF1E8TaOGFYc4s6BTPuiGbSgmV
	 9V0wn9Lic573tatDUvy64vclb2yVVMAw5lEHZ4tbvZHzKEItC84pADwBMhjLhk0o5DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076275;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=rbfK52MJeIblNtZwp2z739bc4ZxBCibRqFdRrpzKRYwr9hFku3TtNXyAir9YwautCpuR
	 kl+qxslw8qiKvgHAPANrIgqs9ph7cyhtkD7CVWtW9qKjpklv6jgp6MgqVBqHwd5yAV//Z
	 uJg7l/QbF4OLjtSEOyxIEtd57rcSc1z7mlyrkpZII9jbXdCfEYIHgHLd3g8zr/0VslA4r
	 glbDJJkqrDeOS9v/uGjOPJ3u2nUSJEFvFkJrUO9VRHHJmjbpX8DZy6BL3dareiaBeSrm7
	 eitWCsmAApbXhmIwF8oIfPccpsUDzvXzUEg4X2YPz8S21CEeHhrpRtjmSsMpJ4oG0Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j00jD+2u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FC606A320;
	Thu, 19 Nov 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j00jD+2u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A581F000C4;
	Thu, 19 Nov 2026 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076274;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j00jD+2uZz+Wt76MZU20Q3rjoviZclCrpbVH1pctpf5IxsZy9ofVHqQfWyxufNcQY
	 2W8L/o3t4GAHpdPCzi9tUJfTSElUteh85tChcZjmWz9YFGIFIqn+0nrmnfCxmN3h6E
	 kyAsf3qhH0NMM1Sf0da8mhup0Dc5OD+Ktvf3gz/xjKMTxHCH/aO4RUBiJJTKOboY7V
	 o8DMYGiJK8gErhadlk4057/LhjlYZfEK1qTJpS+SndvKHAVrkMuJhd36p7ufu7viwk
	 TcaaKBYjUA1RBvA5ZAwYToogOKNpFWfoqleR48xo/fFjIFS1Ml1TREDjOX1094gmDe
	 Y/wUO1ktRL+Gw==
From: netdev-bot+sinfo@kernel.org
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH] net: dsa: mt7530: disable the power rails on setup failure
Date: Thu, 19 Nov 2026 08:17:53 +0000
Message-ID: <179507627334.3291.8585396594383940483@kernel.org>
In-Reply-To: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
References: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
