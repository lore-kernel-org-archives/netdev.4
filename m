Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228657;
	b=1AUPcCRHp5h+Axj9B14bwVO/eTUD1E2bvv6oKfPj0tkwHU9Koqe20TTnwszYFmgjW2cw
	 l9KY0KOLCyzCvu8H9ttUaLEF8fq7Qt3Mh4xggzmVC1TLrM5R7TfDGSwDugqOAt47vMnFI
	 S/mVwOAb9p4Yd9tgFEOp4bOc4oNrE/tSert5ylCh6aoCbbebje+x7MoXhsOYwFQBlbaq2
	 6ylemq3iPzJJ6xBzLSI37PkQBG0BBJiQ7bGSjVXZesScNFMrymXO2ATB6hbeTA0mwnQYL
	 qzqc4Nkz0ZqRUFBAN2Y68pPcL8GroHA8VHG7iKPgFbBBXsZV07tYlMgmioJG102BG7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228657;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:References:X-Mailer;
	bh=EzpmAmVClFMq7F6Zk5WtmBF3ENaauq0u8qz9i6A+KF4=;
	b=Y7fr7EwMzqPgc9ipMbRKgGvHJJ7HNwgUhKcY1YyEFc0Iotss+68E1RHYA/KmuAc54RwZ
	 cjlhRfoH6MRo1V12EceKxiHYZxgMhMwJ3DvId50Vs1zsG+cYPKknHWFmTkCyTePMfFPUA
	 lwcRjavT6G34p7NY4TE8ah7j2rKab1vPHG7bxQ3L59afsjS26VBmIiQZOmfSfndu+eGi1
	 yZJknLdEKDmEN1aKUJDMckzkOAP7G7AtOSV9ZpCmVPm+TjQLQhGjFcgpC0ZzIXDsVA2Uz
	 WKbC7mHW2RBrpmz5SrRldXMZd6ACNFgsogQPkEWaY9++yRY1GuQHEVoYXmx2rJ28fjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SOw6a4bK;
	arc=none smtp.remote-ip=66.163.184.44
Received: from sonic317-33.consmr.mail.ne1.yahoo.com (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F015606A33D
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 02:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F015606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SOw6a4bK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795228656; bh=EzpmAmVClFMq7F6Zk5WtmBF3ENaauq0u8qz9i6A+KF4=; h=Date:To:From:Subject:Content-Type:References:From:Subject:Reply-To:Content-Type; b=SOw6a4bKzqErJnRo7umtcMqwmuXVvZdIhVD2TOJiGuuG2pIE4cHHMomFx5jTTnVU9XK2jLvrRGCcSpfhyR5Aa+Dc4JF6VoME9afac5nnbz0kYity7uxPYLdDBo63+Ny1OOh+/wyYSoke0sbdIL+6HyxgYy0tFINScFhRaH9hA7th9NbbkB+89hy3nLtaJyR7xZwMdDx4HSVE7NFcPXpZiV4xJ3ubSNvDoo+DSGXkksjFWgZbz8qMG/1P6P7jVfAFY0X++Y6MYUVYAueQGFj/p/i7ypVE4op80xoAjwRsdaMviA0PSfrWHCDvbjyMlk4p4E791SzGHtGqEf6kYuYrDQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795228656; bh=CsUzu9NngBu3J4EpQEkhMEDgmymFJmLU8sZiFmjxB3W=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=Z3x8cAB/BWg2Nawdi44gYmxWJY43TlnS6pQPzPeRnnlBynjLaZ9Mb0JGKp5dFt2yFSsbIIESfSWE2/+yS72csrI5YYD42WO+BU9JbndKiHKEw4HeiiZ9Ob2xBB2RQpDRD0ON5aibLAtBrejTJ7sC428Fx7huv+33HlKcxkWhsyjAxfkTOsqQ4z9gC0/u3NZFs/CSe5PRCcLU9luE86kVPVHna7pXK23goP54rw1aZRNlpsNxpVi5ksjxwmD5uY5FinsQs7+sv/oB6TQx323PeBYC8QqR/6LLNjH7gAnNYyCpu9BIw81Hr/6f2XBMb7eetmoY7lpyYxgktZw9TfT7og==
X-YMail-OSG: SRzBaBkVM1lh0bCS6iNVGYf9XDUd.hK27jRhx6Ow8JV4TwSvuXhnf3ZYS.fp6r5
 3RvcvOQ0aNRTny6o16C3xfanHtY3xKT0JfxYMy.hfz1sg7DzECMVmKKBnwYEV5yeITCptoiz4NSG
 kY.cFgS5Pk0UeV4vmpxFC0UTWiPiTmQ1rmKv.E9WrRvwxmX14MCra6J0s8W_lSKsyQOlqH1KkLVo
 KnHez7bc8MuZPopfE45MYNjAbq7vrWoLJSO8mUlGUOwfZ5jWnBTlCbcsSDYQT.IFTVCsHY9feGmB
 X8uAyeBtNMehBvHkv3_su16lA1V3qPagDQVz3Jc0s96_bWBshbLR2OixUMR_XQPwRcvKldlIFu0k
 vhzvnCbeYw5CImZu70TyDki_Jtgy1FRkhkgHgWV.P4IkhhRNuQkrZGMaOgGk59dFJT8IWcT3_aPS
 UYgwz_H_uXKAv1ivJX0HbMfji34.7hvJgOJUgCQOK77LGCp7kk1onNkTlehwCI.UJXvSqIkyPMXK
 x6b_lTvrfRCyddbCOjF7FFi6Vku6LLoB42Lu_fIiRMHv7t1hogy0ZN1SAkuZpWoPJzEH9YPbp.3n
 T0zFGNp8C_gG1afCMow3kkmYPu76_4utW009aDgL8y36yfS.2nxKEswsEzmjxAhEYpWPSZb4inAu
 j7fI91xdDHKpcqafaFT7vzqgsM.8tSM_pEtrgxCWbi07DwGdGNJZ9DF27cGwWhfr_mCUV4AvKNd.
 YgNtH5wQuX73dY4TeesSf8LAvRPsAVSx51X1qFqgueIhIRxJNWoE9cJ76zGOlJfe3xip9rzv3ZBv
 sgdx7K0TYckQbqNaCsVEpNrNNvJJKnfJ4rUpbhV0_pTr8rE2gmPhw8DBiCb35wKRewqkWpq8NxRz
 SfOzw1fkueWxBCi0J.0QDidISv6YZMUOpuC7r0tyfw4FfptK97UPLv.oJpAlPihR9Wp6sqz.KhOP
 Y2HdiVW_ILWruc4juis5GOyZUqg_xvBYiWruquwwJW.XsSwt0l9qT4CoWn.7ClogU1mtaJcE1al_
 PyAZOQ3Bs8dVmqAm8_Say7lDH34eHAOxPq8WKu304vDN3GZo8IW_qehvbyZBacBLjXk2ASI_NeVq
 u9mX1rxHZmLnXkxydj1AmJGi9.0iMeTzUkljcLq43IcG04KDvMS.GUUt6ql9utISKvd_Ga7WXJAh
 jTAQDs0MN0leJsi3EPdH8Q8eU7nAj2N2ewK_uk6pVyG35_UrLYJKQvRDOae0fdIFKwgoLc1flUrH
 HE40oajGXTwXQPoaTVnDl086PuDw2jJNARyPeDGdX2MVvDPnJRtmaazhzyXvgGe90uQFpkgBXmYu
 9aqZPvGEbSgh4fnOiPTOzuYnBIzrRjk3cfhQh1JowMJqmssrwBq3ol5zhYBw.QfY8M.rfstKTk0A
 kEOzfXlmo9I.eIdc6e9xZVmLIy9sBSUtkgLH7qyg5NrI50MClCnvMlZSfUhAH1aUyU6oTr298saU
 QDWFpPY7j2DcDs72WzBElO1PdRrtqnwh51DUgXTslsuh9LZzN6NUeyHkO4X.K7M8rTsoqPwJZilA
 ZAD7xyMaIy_rBqUcuB_IXZfKeIyJlAHliiDzhNZVUnnDwOQzHZnSOAEgSZGaG3NNGRSaCdcYzwqb
 3WZbJSLKTUySGpM_b_upQ_xdoMju3kqeq16XmWAla8qrCY6F6KqvGtLuvMhUmF2I.V8.JhIetj.e
 4wsCt8YRA39tBuqHpPS5TiRGkHNLLS3_8KdnYSVtYOhRG55_dTU5yLeVTuwIMhx6JZkYYF_IgA4E
 lsPnpdtz0QXD2tjzMN7uSTFeU4S0I8g3DGOlzpiCdbT_uisPY9PECoQKJlNvh4JjkFBl71q4vlzh
 Y5aB0lAxIuk2o_u.SSBpCZYHxiqzPi8hA9MTo3DD8ItClzJ09T0iDojbsLiT1EWSFTQroUTi3hi6
 8WLqoNWcn.xNxICbgJtqzAc5_9CG8yYaZ0bbDy3wxCbUXdmcgG7A865VVENWRS1k.8bI9QrxuAMA
 zUWQvPSPG7doMfoO3FhRnPkY_8YLj3GBmSDCAiIqV7907R1bqwVae2cGYE8XFLAM0tZNtwq.11gu
 ZLvee7EBEf5Hvx1TEoUARg5hckEYLY2X.vzqpcP0fm6ejh_ZNLAFhYknUVxg8NQp5y9bqfS_Jcg3
 UGM7KtlEHHG2MEgk4N6GCYAI.IILqI4zTjwZMu16Y9uBA.u0Nwt4Saktnb8lyDV1SVcndjdmy.fO
 nZJcgCIU_LUzPg2n7V6cJPbXHpOzAMnlSuYhEAN6LCIVGP6NkZdVh4HwUvCTI70rrxsdYAsMk7f7
 w_c4TJy6e6d7ZUmpLn8WY
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c64782d6-8067-455d-8f24-53fa3193980a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Sat, 21 Nov 2026 02:37:36 +0000
Received: by hermes--production-ir2-7c4859dc89-fxzr8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 982aaafc58ac1cca73c7bde1b7f0727b;
          Sat, 21 Nov 2026 02:37:33 +0000 (UTC)
Message-ID: <8778f095-2903-4677-be82-fb1bc8284100@yahoo.com>
Date: Sat, 21 Nov 2026 03:37:30 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: pl
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: Question: netdev-ai AI review embargo changed from 1 to 4 days?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <8778f095-2903-4677-be82-fb1bc8284100.ref@yahoo.com>
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Jakub, hi all,

I noticed that the AI reviews at https://netdev-ai.bots.linux.dev/sashiko/
used to be embargoed for 1 day after a posting, and the embargo now seems
to be 4 days. For example, the review of my series is listed here with a
4 day embargo:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com

The series was posted on 20 Nov 2026 02:21:49 and the page says it is
under embargo until 24 Nov 2026 02:21:49, which is exactly 96 hours
(times as shown on the page, in my local time zone).

Documentation/process/maintainer-netdev.rst still says that reviews are
available after 24h. Is the longer embargo intentional? If so, could the
documentation be updated, so submitters know when to expect the reviews
and can plan their respins around it?

Thanks,
Mieczyslaw Nalewaj
