Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408187;
	b=4I6dMZcweLVZu+VA4vTfbCra2fhuPzvNekqoh7eu7P/vGQ8I49xxG3FrfpEEjSYpVYer
	 ms2dAAhxUAafNKib4myf01df70llCi/gUMOspg0s+9NSX29KvAfUUfPH5qoszq5jY60FF
	 O0FX2k29TwwM8YmTrY7NG23YwmCGPhd9SBegl3CHFBW9UW9qmCBPVTN6dmnNihzcL5s51
	 A9K0YJ77bbYYhv8O590qap5oF1rCUDhBoYZLYlejteu8aeGyjUpXmDXRIWXl5M1vp8e68
	 zGlW04cIsahmZnxkibMPZiZOASJZEyHMsNNTWYOqn8fc8eu576NWRDpCUCqG+BLJOZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
	b=j4qIOjVfV/p47NBMbYHlTKSrnWoTDJ6UTLl3Py5t4yQIUZSm/SeFbG1weVyxNZxQ3gJv
	 gTevTCSxYXPNDr0r2oOX834e9yOxRpiE1ViFKLewlZe+VpZKDRWuuayMdc1stMogLOEqz
	 Bc8DLT9hbKLkdMLePyopYYB1GzieE1fvq/8CVKAZNnqJJ7/dPxs8KY2TxJBTCY6pkgbrh
	 gbQWAWLHcn6MXMd9uZAQHPO6AtWwZBNlfAPqE4Q9A8tt/PbAieO/yRUprMUDGsLREBjWS
	 TxLFUvwOPyMvPMNFaFX/oTv3MvuLtkM7rHkRNfiwmG80W6Yft6yU6QFJ/Gh4AbLdc1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWdtccDT;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4450A606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4450A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWdtccDT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38431138772so3669465eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408186; x=1796012986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
        b=DWdtccDT6iZEW9tiBn8SidTw/gGq4Elp7wIOV1zeHWPE3GIgA/far/hcqTjp9XvGvz
         xQEcBvEUClWNlb7m5npBVa0x5g/RnMCcHjdFh4IxMl4q3agcQHtsw/FBQkMvpQ1pGWE7
         AneWs1K669TpL3zQZlBipDBosbfDttiXHAjVEkCnPlcgKDklHSHaJ6UZ+o1zdY5egaEr
         kfVAWMOmsFjLkr1c6RiBltT/FmMFtYxO3ndr37GaSLHnKM1f03ax7677wxPAWloQpEDu
         LnnbFo1CQfc610ArsE3Ql5VrbTlTI8lzmP3gnkgw4C2yMw1/U1Bmlto8nkPJBe63S+18
         Pyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408186; x=1796012986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLMnyfwDcXeZXg//v+DD9Q7sPFzFL3MyagznzzULhMA=;
        b=zzLvNXme1ibtEvGcximQXGk7aVbHSMY4PTK4X/UHl/hJaRJZQLPegV1Q558ni0oX4z
         qOs1BO8zEAcyjyGlG8K51FHfHqJJXlfAMUeItZSa49plvirXzLIcDk3uAeMIypkkw54M
         1m2oh00XJytt6CUfHtQ0YPM6bIKNfjYAvj/6Ge+pcvWAXcFWyQ5HOrxxKHMvq2lf+nPC
         AudF1aUKXOLwjoidlwKVkb6fVsLCoArDDDWKVdnBltrM4yttX4xTQLfm4LuihhBXaZbV
         bPJSIiuxUQYlQbVfiTyfC7Z2CfrqCv86o1nzUiiFuN4ZsvhR0bKl8xnjn/U0TJGGoa7S
         UJIg==
X-Forwarded-Encrypted: i=1; AL+hErHu5cIMGbNGKlTuxLjSyXRqG+PADJ+My95pobymUR4DOz1+BiOXdCbbr6VtZLj6fi5pq2gwZ40=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c/Snyaz1yeoy0sBCkN6W3FifpBYv9YSnOyzP4Vu2L0sH+I80z
	NRF18vGyChxLnpQg+MXx/4up7gSYVPwaoLJjshWzozh9yniwHOonS36V
X-Gm-Gg: AZFdTZcKdn6yumDyXJyXw25xje75TRlvSk52p7mZDex0gDJTfz9kTcdfykrTEkEO9bQ
	P6YhuWbCZ6OHsdDCaYFJEZimKmW35BoSpqyHqtcec3dofgx83PPAxHjL2tGX2YzoUMtnapHJyJm
	/3dr6dPOXtJVXHwUF87jK4O6f5nGOWQYDhbL9aeW6FXh1aYHyLg44ybg1W5gWLYzfw3g+y1EtcZ
	soQDHUmdGahijrC/zB0Y5ikdm33lCBfi2Lr6eVYP82TSdzWiqWC/Wn3V1Pvlr6nurSE6spEOJ5z
	uoJRdkPB7uSO9cmI4oWgcFSQwHG5QkA3Hn7+NVvlXYSTaLGA0CNIxhL3O/9Urtxtxq8SA+Tk87X
	MPeRPyJmlklAcrbFwDvir+rM5WJgM+HpalTZdRzTJszQF3RxqDp+ceuHQTzXYTYqnN4ig4HxSA2
	EoBWwpUJsJmrYYcYO0rmgAdxGvsw7yVlgd/eb7AXO2tJwJxqoagLrzOZM4o/DIsnG+bqWnpCoaB
	VT+kYSx5BTcsmwbDLBlUQ7r63cJu65CMvkDVR64r6zfEbtoct74HjjXpufchNXQphaGSSBBm3z3
	PZBKRo7PTVET4OpGYaFckU0Pvur5WHuKWCtW53Z91VnT9B3PoJE4RUv0FSZqwb7psNs=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr12237050eec.22.1795408186322;
        Sun, 22 Nov 2026 20:29:46 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm33562090eec.22.2026.11.22.20.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:45 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 0/1] xfrm: free the policies already cloned when a socket clone fails
Date: Mon, 23 Nov 2026 13:29:41 +0900
Message-ID: <179540803323.3139700.5340002553684152759@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When cloning a listener's second socket policy fails in sk_clone(),
the clone of the first one is leaked until its namespace goes away,
where xfrm_policy_fini() warns. The patch deletes the policies cloned
so far before __xfrm_sk_clone_policy() returns the error.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v2:
- Check the new socket's own slot instead of reading the parent's slot
  again, which a concurrent setsockopt() on the listener can change
  (Sashiko review).
- Send the patch inline, with its own changelog.
v1: https://lore.kernel.org/netdev/179505710269.3511679.8893709762919027206@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the warning.

Kyuwon Cho (1):
  xfrm: free the policies already cloned when a socket clone fails

 net/xfrm/xfrm_policy.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.0

