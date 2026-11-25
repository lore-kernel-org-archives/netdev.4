Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598598;
	b=rOumiRaI3smG011i3V2DWmYY+4J1/TG2enam+G+mQ/QQWLonZ0T+4/IcQprNZNIPw2JR
	 co2yILq1+jpVmW5Z3d5Gd8dNWLNMHspZw6zmZos1UVMHV6ld7G7R8+xFv8fc4A5JtG+Pk
	 iFl/Jr3WJUKMSFfJeR11zzUhMlnOwMvRXLt2ByctkOIpk3nhecHHPDOskUnnZsuRqvKD0
	 jgnO3MLA9W8FuLFtYWuHmL31dYpAeeLsQnswvunEMqqaM4/F75Mj3m0bxtBpwpSyDOMrs
	 WdgGbqx3Uob+5Bu5O2cODIfa36pp+1xKxl8pqUgWRBD+0wj1Qh2ZhTQoIla6AlAB11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598598;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=25kG0hhp6T1mLHkx/5ONehmgbgOOM0UNlyF3UcCeAy2V1x/Vp3upsBP2Rrig0himXHNO
	 WpfEcApKxsD0Ppk8DTx2To3B6fwZ10IFfB4164+6UZxW2/YdTShRRfmIKroFK8d8l75Ho
	 Ygh9hs7BuDHN9HnYV14hyoo6y+B1BFLNMruH1TNx1czbdgBUTqIonqhMtPX9YYRadY2aj
	 Vv2FlkvgvhkwOsWwhbJEYhDXpvNnFzS5A0NIQJENmm9Vm5YSHQFtSDeivNYoxiCsecJ/p
	 z22eA50NvJoL8FWTfYz+scWwNM/SpYIrWnV9UIjtcbyRN06v8IVU99+no5fu4oyPilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2Di0nFW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58F606A33B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2Di0nFW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B771F000C4;
	Wed, 25 Nov 2026 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598598;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l2Di0nFWWje6YFp9wYkd2xUrDLeQeXEYynXVPJkGNIzQbmEPl7oCXMlFmh3ZXbXKk
	 Eovw8cIiSCdSfJ9zziK6JPrfx+ROZAd7R+JKHaFt5VTTNcNFiYr7b4lPoTe8XTVmkA
	 Ixodeu6Mo3VAHPuqhX1lcj+zzM7mXQUHdwkYpEwOOuOXDEerCSYWsF0b9QvgoQFNMV
	 G881CEPVqa/0Q9a253HWTz9Y8wr1ac2lw+mGg/DGmgJLDtd3gRMn8IUlvBlLquPcvX
	 YdJoLcBt2zuAaJLoZB1cyReJOaUWZGRvEh/UI77APosPlWzRGMGV74Ph8ER6nkzSTG
	 9GkNV8+FRBU1Q==
From: netdev-bot+sinfo@kernel.org
To: ck <mjkchengke@163.com>
Cc: Frank.Sae@motor-comm.com, netdev@vger.kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH v2 1/2] net: phy: motorcomm: return -ETIMEDOUT on BMCR
 reset timeout
Date: Wed, 25 Nov 2026 09:23:17 +0000
Message-ID: <179559859720.3294.18444813646422214701@kernel.org>
In-Reply-To: <20261125091638.1847020-1-mjkchengke@163.com>
References: <20261125085509.1844883-1-mjkchengke@163.com>
 <20261125091638.1847020-1-mjkchengke@163.com>
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
