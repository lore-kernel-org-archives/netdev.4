Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408179;
	b=k51p5+QbZ7M/tkkGYtWpsYOao/fjSLjlfsQ1ywXiLQNA8px3w4v8rZbAZ9cA/818Je1Y
	 lMU0O4C2wK10PsGedHsBG9CgbVQPzKzXtU9aACUKMimRssYnv6RC4lEnM7JFzh1Q8d7xf
	 QD4XqeC/9t95D9V67EG/k7BpXFd57JDRjIG/j65e4Ad3P4w6bV0firrFpzXaPk+jc+rtW
	 9vdu5Pe49Wf2JuPH1OaIhDmDC+f0LBZuFQnOCHCJnAolf6sAQBWieWpUMCOU9s7zGKGc1
	 w2Ft5icpnhu4T04vS5sMuEFs7C/wvKlRgKEXgP9oyEl6z/2aKWr9ZgL8svIBngBL/Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
	b=vsw0RjimyEygeSwufZd6vXgLWJBfCrkyDRBUohpGqlb6y90sfA9uGLh8crcgOHCtxfi1
	 d/5CwlFxS0tcEs5Y3g9C6w9sGEtZB6ipm+Y3kF74RNBGcCM1gmbTRoHjU0WTDfe12SrrH
	 0WBknRAA4/zFCTVjAV5hWQnG1AGf6NSqxplAnbyb6EMjBLdMq0rSWGJNbragBDx9pr+tz
	 Eae5HEwyQ0GWrfyzlZTK9sYsCiyJx8EN6ojAjt7TY447A0qJbFPYhqg3wOK0qN3Dijw0+
	 iCXaEJKoxcox0aStNBkZZvV26NWVVSo/mgOkAWXmOEDNZSFLYExVYX6bcZTrEA7zaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUHUGZaE;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6073606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6073606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUHUGZaE
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so3933446c88.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408178; x=1796012978; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
        b=aUHUGZaEEOEdNzNk7jJlnPASzHhhEnHRVaIhMy7eYVLp4Y/4cOgGMgya7nmlEyzVbh
         UZgh943sTiJsR6xbuAa8fchQmXtuq/GwssxQELv2dy8c32pZ5lRrktP6Hyf0OKplQuea
         mKFBcFlf0U+ShSFqAmU4CrsYDybMSFng9zilxUCaD9bW57CKuZtNtiwv6AalDbp9e9QY
         /YdfKnNWWCEj8kZd7ncag+85jEEvP9KiP4fEGWPtnuN1ee4MPG1VA30upm6eLUVt1UVA
         KQJ7GmlXFOJAloqENl+ZxDm5ADGr7jn+qWngQDMdU7L2J4+AL6Z0knQRcV9NrUD1rhff
         Kfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408178; x=1796012978;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
        b=vLcpI54oLeH3caxgJeSneHrP4iHPIylYvROtkmmSIZ+nRiFirXD236qcrIJUvBGco8
         ZsIaTyEto5VUjUVNcn+7L2yZtK+8KC4pltw+YwPWSym1EWYBitBkQZg3eTx798wXZEJH
         srMMhMGujhege+hdYLxckBCBb9kUePmplqBdbLDn6GZSuMWfqXJlLgI1MaT+zJR5MMhY
         OmNelB41IFwZRTIO10pdAS99z92gk6E7VgBKesHYP9tizKTKGmhE1ThDiIXM6xSvdnFD
         se+yW3ojDuG/Psub8XUDHThY9+PNy9typ7BTGBOaYD0NLq1w7IcVKNN2gk4Kh+hY9SGl
         2nsA==
X-Forwarded-Encrypted: i=1; AL+hErGSufSD6gIgBf8SkAIPdBJ4z6wdLiHVSQhsC1OBobgROZHGeUEoSmNRpnXoysc+tgxzYhfneEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uN1xFCQVsc7LnN+Rlsz23mmUdv89GtSpCKlGyQtTI0ePfbEXi
	MRerpmSInBFpHG9jRa3V050A6qLQ6yytIrdxFZBQQAapGJa0U0NnEmH7
X-Gm-Gg: AZFdTZdB9otinqiux+RvpcEv7G8yswjUfWAXJOKweVL+WCfaQi+UBFytpsLZ6zvXLvp
	BV8rs1FXGbJqypyqalhrvfq2DOFBZ1JhfSrHTWOzGeLy8y0Jo3XYypQmrsIuixAR4mUhJJD+edv
	K8x30U90CVTrbOSbbNX6mFmp/MLi5g3E+ea8Ht6bO/7VPHUbptEKEm0uOpUv+kMYSngo5P9V2oj
	izfX3M+DVIbBVvnzS+C/qktshypK5fnBt0+DH9SQNqtcccCxf4C2pfYrjD1eNks/+WCx5MLY6QG
	a6ldJMEo1a8KRnJzCP3ZFuU41fNI1gdQPC9hqZYQQ0HdV1yqzZmgTQc++1mZYBPKY49FWMyokxu
	xLDvAXlRU56bhoEqO7vlgeQMv9g9CH6AHQG5SJYq41+0jQ6Ryt+gmQIHVJaRYeotOaYe82bIO4N
	OUiq8i+55dwGS9QXwEFF3AyhlfgCPfUMakI22AaVTg4dNwIA6VQopGF1NJhoz+Z/gm284U7ufHi
	cuZHUKFWusgWtfa2zGdaZgyomRThJb4h2R1wZBsVHW+aF2Inp/0nHioAyQktjIEQyzPQcc=
X-Received: by 2002:a05:7022:62b:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1b55686d67fmr14706089c88.11.1795408178021;
        Sun, 22 Nov 2026 20:29:38 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm17703865c88.11.2026.11.22.20.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:37 -0800 (PST)
Date: Sun, 22 Nov 2026 20:29:37 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Eric Dumazet <edumazet@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG] xfrm: a socket policy cloned for a TCP child leaks when
 cloning the second policy fails
In-Reply-To: <179540513898.3135.13913410077710347458@kernel.org>
References: <179505710269.3511679.8893709762919027206@gmail.com>
 <179540513898.3135.13913410077710347458@kernel.org>
Message-ID: <179540803327.3139702.4403349042486439775@gmail.com>
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

On Mon, 23 Nov 2026 03:38:58 +0000, netdev-bot+sashiko@kernel.org wrote:
> xfrm_sk_clone_policy() already sets the child slots to NULL before cloning.
> Would checking "if (np)" on the child pointer avoid both cases?

Yes. v2 checks np, the new socket's own slot, and is sent inline as a
proper patch. The report was also wrong that a partial clone leaves the
parent's sk_policy[1] in the child; that slot is NULL.

Kyuwon Cho

pw-bot: cr
