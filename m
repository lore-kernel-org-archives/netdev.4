Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966138;
	b=LpvNPWXdeuDB2dUCpgvPaO4cXWdKCh5TtCTbYt/0WoliQMl2nT8FWm+FuizW7v12ayYQ
	 xq0jSPugt+dRkeKJAvdrtJnp3IuxgQlGkENYSWNR4bU0E/EXdtr9GMX3SdIwPJcp9XrhP
	 7Ng/3Bq5VMjAWeqm9CMoGcn8432gPqGo2eDuiui48SjgA7wKfwpG74OFzLjK9uOdmRswP
	 cxDH2QkfILUXbYE12KC8ySAxzP4xXa4tLvfnnPVKl8HQlAHkHUjluLzxBKnr/KT26ChV9
	 3Z8cEtXjLeu5SdYJCNbEbtvk3wSWRsBcU2GGZj+kqbZ5A3/21T7mabZRYXvbWhwiS/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966138;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=L6+Bp0f0diQR6UkLZvLWvWsdahW3g+iiL9WCEpEaxNnBz/8hnKaBFhcOYBZZjz6MkYeS
	 XHYG2oCpBQ36smG6qA20Uu8HpbXRVd5Ke7rcNa7jIL2JTRQkJ+FqCxdrnozxAu6UaaCn8
	 rGyAp16eXypvTePpL1Hcav3CxoH4A3cERdoYRwgIcORKVfnsHARal2UHQpq+UjUL3bpV+
	 JfZUkAaT4ZE8T5BSQ38cdJ/YMSAceR1qwRHXZN/CMLiLKJHY/SfrrIf1gTtPmoCKnFv1w
	 WNlcDEt1Z/OWMrBn4rpTOMj8nkTzDTFYR4mt69u4JWUwDC85D76RNGflXTezsOybBNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iH4YY5uU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78A606A31C;
	Wed, 18 Nov 2026 01:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iH4YY5uU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3EA1F000C4;
	Wed, 18 Nov 2026 01:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794966137;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iH4YY5uUVwHBPFQE04mnSbMXiYue6UbP6zaeL750IRaxXmzTFEbOC7MV7VXxegSMR
	 MULt6xkNX1UT06QImDHmZJIcg6BtUNiCfAMz9vHaK+744cb9uvQeseueVafWGX3h4s
	 5amIqPetvROzbKbMLptsiHqTqIXPIWl5buvAXBHdJiJNdXCpwM3s55VLapn6/1IENh
	 80CXkak161loEGxqnoMttU6OiNTQcWP2PkhB9TZW0E2Naoc99/OelZzS3eTGp55SLW
	 t04o6nHb8o+4cUUzTudM4lQo3L36nvs4/q0eJ9Z+fX1EUvZlALRGtb2zoxysXhJDJZ
	 JtSmufG3atWQw==
From: netdev-bot+sinfo@kernel.org
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, sean.wang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Wed, 18 Nov 2026 01:42:16 +0000
Message-ID: <179496613691.3291.15730962134420645853@kernel.org>
In-Reply-To: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>
References: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>
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
