Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421143;
	b=lmRslaQZgXKaTlQW6jOMQh6OQw1Vlbwc0U6vZmj0iK5ZQsAFeXkHybLnec7UpqrD9+Kq
	 c3GseVJ6xi/ASK5EUqlOagX18lNCewLz19QJsOBBmS7crSnksVwx8T1tC5g72oWDgQSBC
	 Dd5ao7MLIVV/0FqB69KttFJDmimOPM76+pseD0sajCzOmCAD3+gbDZ6RGrN30BdQlLj/4
	 eOJT7h0uv1rUKttDAvbVhy6QtIN+oUhMme6Dd2Ubqkzo/+MCm9gy3E3tYj073hS7D2aEU
	 p1bNT8fRTGpLPjyoRYOxx5ZH/osRzIMZtgttU3nwb8AfAppnGIDHaBXNoOJVl95bSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0oB2KC0kks8dAOw3JtWoTCmYwUhBL+wqoVHc0YvSXq0=;
	b=Tzp9NJg+wgpSt4TQEsDPEXIcYnd2/1XX+cJ4RaCbXLtyNf3qYnwzTmwv3QQMYPEhpm9a
	 nwuoEgOkqEILkRY20WSSz5oYJV6p/LbjTZS3o6LgYEDCNyOzt2Ii+jW4ONi25A4zK9CtE
	 jz5zA+N+sJr8mQxaopw4U7kZzVuoTmWbQVRwXe6giCWvGLkymWmV8/Wrfbo3d3hB9nYgX
	 D5+lmkDg3Q381jRDBPTlGlIl66Cw3Xqx+/zgZ+Vv3Q87SIPVwVe4DYXMgVI8DcMzXkUbQ
	 XeIeJE96ATqLt+XeDA7tZa3HWFfEn9hdLBwij95zZxuv6RN32V5qCSFqcqrVGqadHUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSTJqkCX;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D989160A5BE2
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D989160A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSTJqkCX
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1642028a91.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421142; x=1796025942; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oB2KC0kks8dAOw3JtWoTCmYwUhBL+wqoVHc0YvSXq0=;
        b=DSTJqkCX+gzDxkrzA4CTsuQFZ+7H2LExmh2TUPol3p7ddFdrUa/nBgAVxqM1dv3XfJ
         oiVk9/k8rebnbTCC6l88m80ZqX3IbXMtkoo2zL/Ay/jz5ZSIQTG6JTekYcS/4llqECRo
         vdqR2gpJpAlSkMzHtUUWgsBg4LfSAkQWE0dFlGKC69TRo/hKbJgI/YHXM9+6vAs7zF+8
         R7C80w9kJ81ndktVb+lR1HvnmcF+uP5a5PyU8/+QgG9c3evMg7u0gryMsj08+cU4V0na
         hcisz8Qb4VLnEfRuIfkpk7HoGMema/g3iBgUcSJtevpGSoIgwVIlnauDGVeOJfJDhe6f
         ghcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421142; x=1796025942;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oB2KC0kks8dAOw3JtWoTCmYwUhBL+wqoVHc0YvSXq0=;
        b=klhPub2L6wdSonVDHjomI+zxQIl2++T3gzVeUjJy/efBCUxaPok7kckK3FUUpLEr6e
         diPOyhF8H5wyUSWKCJ6iy0KtJiSeiJoWTrDQBz23C0b51nlM6Wdnl8+/tW1vbkB9sDeM
         Ol50sZCfRe6R8zzJlvrq+Asp2Js0DyxKnBwgrseySMBlDeMb7K7HhDBAoab1tJFbwpQ6
         vQoHKXFNDnlZTSMfEWp011BZqFPWwedCRKMz0txy+iG6DEhSa5kj7XPpHXRmsHLD8HT2
         WO4j1PDY5MqzTxdRV8/gG7nVhIYQKUWeSP8hwBI2brH5KJ+eSqukPDmgNfl4MqR3SEN1
         fm1g==
X-Gm-Message-State: APuU4Z9vZiBF+huJi51yoc3qf9xEfxunzUYZFNj+y5daQv0jScLwX6d3
	do06OQ6ZapaITa5B+ZOECaHG/WE9I7MynO3S5k4LJOw70vupaysj63o4
X-Gm-Gg: AZFdTZcaPo0IzinRBQGZw04UsYJCvO8o4kasJ5+IsOH0V2bgyD9ZzqjwBeER2on254C
	LhlJ3sv2lasbZIGCB/AzIuwJ/u/nsbwokg7P/VgtSoFkiJ83uTEdWaMgql//nDp2LcnuguftDVk
	ihvUvRaLsfA1EyyKUkZUAtIYoOLA2UdLg/qyRZrUKMZzuInsPEqPR+NZ2XP/06sb519Uqyrhvhv
	a6hoxGjlyN3FCGLpjqX/CdJAM73C/Mf50Yf/EYgEItbBt+4JZZT6qIKkRZUg4TAz/JuRUKnubUP
	3njGGGfyEQj5j3p7FL8LKqIl1cIoXILUPJhtmwCW6mYnjDWXj3ZP0xpLx/Q4zvWL9yWaFASC7f1
	U3DzMg/s5CTgLkLnXAOwcSDu8gXJEoB5M68F1e1QAhyE0Mm/fDcLudvX1x6bFZ1vCA5qxIhws56
	7SIIzMRXhoWI42d9hlvgBKl4W71/OrXbv1hYodie2/YKDqb4UfmkcMnS7EXBKX2ajPOgLiIH6DZ
	08c7XvKqhZtu0NiBRGQS5Oioj8emJg9w0zs0f3MtTlBjpe7MKaO8pyyq8IH7Ka/wWo3V2I=
X-Received: by 2002:a17:90b:17cd:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b41c95da50mr9088833a91.47.1795421142137;
        Mon, 23 Nov 2026 00:05:42 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f12028dsm47209485ad.60.2026.11.23.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:05:41 -0800 (PST)
Date: Mon, 23 Nov 2026 00:05:41 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hangbin Liu <hangbin.liu@linux.dev>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-Reply-To: <179540476963.3135.15854448705865137311@kernel.org>
References: <179505868590.3571070.12381528230330714812@gmail.com>
 <179540476963.3135.15854448705865137311@kernel.org>
Message-ID: <179542086429.3214461.2008225946774527848@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

On Mon, 23 Nov 2026 03:32:49 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Does this fully close the out-of-bounds read on lacpdu_mcast_addr?

No, the nested bond case gives the same report. v3 adds a patch that
refuses NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond:
https://lore.kernel.org/netdev/179535729502.2645501.5219010464870440@gmail.com/

Kyuwon Cho

pw-bot: cr
