Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509235;
	b=pQ1P4CdwcjRIpAl6l5DqO59/Pa8gKW8S9Bo/lPxjap/q63A8zJm9TzA9Q7FodmSuvH2p
	 QYIZlj3ylfziaH1gedu5eX8UgORRimIgxCYGIgt54bprREh+fUZnYpaxokx2yATQzTQ7Z
	 e0UMYujlctL2U7RNO7472Wn2aylXhR7ylTgXPQFiJ+w9WUdt10gnclCcG0ps4cGFkWNiJ
	 5oRjO5Y5lY/3mhXqsrWbTod7YsaAWHp4j1ktmUBxzFavUaLBKFZNmXX8nKAujlxjD6J38
	 t7m0kShsDVA/sXIXRo6j9V9Ul0+et3lXWhRXDjFz/CPV3+GiwyRsmn46OZz6kNUK4mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509235;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=huA/begsnLFN0e82QQTq29KklquK+yUlAd92cMOqz8GDN2bw1fNvwEF+FddtFNQgm2uJ
	 7r/hHPrFvCya6r0v5V91DyjI73g3jGIjWHPPSZ6fVvcIsiroLVvooU+BKmO0p9qk2Ngkj
	 fs6q7Amxg1z4JITn/Ya2ey4lELkOgHyzeINXHAGL0aU921NRXXq9PbWfFfCNFoHrgH4mK
	 mFKCbegExBfQrNZs+4w61NHPLCOjh7gUd94SaQxHTJmb1IYGR3Q4FLDtteJ/6D9Zh4pcC
	 t7VHgCv5UXQbgE+AkhX4IGsSWfv2mrEWUKLE1jAHnsTsRjG54cKvbX/1yhJpYXrx85Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGEMqlcg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABE606A322;
	Tue, 24 Nov 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGEMqlcg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20A01F000F4;
	Tue, 24 Nov 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509234;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IGEMqlcgvVG7qjPZnWF/EvjS4T5XJNp3MRXL4J5fqVQ+yyKsM4jtYAilJmHRcCBHI
	 raONPGa1zn386DY1nwlcevkSycSfqwzfVvPC1mJtTOHNtmVESwf2kWjDHcJcK6W+7M
	 bXgRhPJxPcAJU3eZslQU3V2DjQiyUEYDy5bzqGoK7YhpNiTNYdYuNSsN9gPqxcRMhC
	 tIK4rVRGLdfAR8UVsPChr0NcpQ2zPCU4Yxyrma4LgyPg88K2NL+pRI/adjJEzCu6qC
	 v6DQBwqx+wjA3P55tshEkHSNwBVo033tfrzH7m4EoHbwXKoyQIcjXn0ojfYfiVp0G+
	 uaKo1F0owhsoQ==
From: netdev-bot+sinfo@kernel.org
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/5] net: dsa: mt7530: fix regulator disable on
 teardown and error paths
Date: Tue, 24 Nov 2026 08:33:53 +0000
Message-ID: <179550923334.3294.12037286657599543494@kernel.org>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
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
