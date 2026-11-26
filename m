Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697615;
	b=0ailsskmmD+2AR1TBpihFNipgQX8w67Ti3nqeyvu3N1ESdd2AFH42WLN+9eB9zBi1AWb
	 TAjeAyMHHg/LYDLYZxHYJF5A1xL/G5A0CcZ4H7c5gsu3ksNiGcPBOeE5ut9vp+SIFsVN+
	 ZpLtflLCwuerqYfZNcdywrvJl+cX133DawcrWY0NHsmMOmqNc8vap64qEF+zQIwNf6ikr
	 27U3+L0xVjdiyRXlX3AFF8+pnaAKv9jgPpUFKL6nz9U18rovZqzz4KTC0fq43yjP7ANai
	 rmhyw/zBbmBwYduL83CfCJLh+GZp+0NnZ7CNEGx1sMC4/7m4m3gN7HgikHELsCYYfWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=bmtlhaPN+gOt7zIFq2/ePapbjgUw6ht/EkF6+gFaMQ0=;
	b=qfc2cDXtrW3eZp432aBG8jJjmWKad3OfUnsJROKkXRl7yxPTCMHosR1dKBwOeYJ/99yF
	 cZIGsPOM6aTOvilOymgPYd+5HFWKLlFVC/0JLww/IptdgOvonecVorJazwj6kSSaQzfrs
	 VkM2fGCUox63xsJKmmBGBRprnIgFBK+1e9bUPBp6EPzfbMjvNWvV8EKwuruI6qdwsKy89
	 obmwcwN9n2lQq5fQQQjAzpMCVbny+tFrvcnspqxyMHf2r0CUq+Sy3HNu7ouYUIJZbPjWJ
	 n6Fo8l9Ov+RDN5TK6Ghu1+afVpjS6DOj+XBKwCTmtZigTJnQJTL8fId0GwdBEGojOgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikLYGEzQ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1A2606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB1A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikLYGEzQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38699cf08dfso8530377eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697614; x=1796302414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmtlhaPN+gOt7zIFq2/ePapbjgUw6ht/EkF6+gFaMQ0=;
        b=ikLYGEzQSITV+6cwxKWzjpVqg63bATnlSCI/HL/il9UkQwjkPdH3D9yGNAO0EedyD3
         KFaD+nVPPaozbe8v7spwVXU59iwLkCRg96i0eK2TPlT2I9+KSYZTf+hug/F1Dcai5bNF
         chJlF5VTKyWKa4yrKs65XrPwM2//3siAZVYG7wEhKRoRdRbHzxPt9ygKjqIvgKH+0Die
         KQgSQskw/Ijhus7cRgc9qqkkSiJKn1M3xQ4l8o0flnzsghipYICvmKEG50AO4hOukGLj
         TJjBRA5DHmG6oac8cvyA2uK9sLbJheSlfVtomTjaeCpbEszyASBVGIgcw40x/1GcSZRg
         zfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697614; x=1796302414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmtlhaPN+gOt7zIFq2/ePapbjgUw6ht/EkF6+gFaMQ0=;
        b=bh+PjxX8AKZJSF0qsHEHKOjg1sXV0Ab8Czzg45n1LGkKu4ZPVcE0KLU850dtkKj/gj
         oo/Ichk857EQMyVflb9nOQ9GR0FX00YsUYU8k/YZFQdebleN9RNzbrGgm7y/c1r5r5/t
         l/J65YkmCMvcfprJ6Rdwcc0FW1LKGJ5yVQsZMSdgghpn2MG3JUAgRl5FRc0EwJhs7cSf
         hH9oL7ByNG5PowD+k0L8+20/3V6HpVixH5LcCrf7lZ47pFbZs8l2aDwRCEgsE5Y+dL30
         YTrQ2S14ZxOXPZY62UKhm1kdgPLhJtFatTrzZTHlEwd0FJ4MMwxGVmS/98iuiBF2uKjO
         B47g==
X-Gm-Message-State: APuU4Z/Dwh5cOA8RdXWM2FNm+PuJF7rvUWDFbsEk1JkogppoHkWNOqJM
	Eqi6ZTeDA711LMJxOX+aV4+0F/Kl6iyZiTb45xIWtjjFpn9Jx7T+fodX
X-Gm-Gg: AZFdTZflv5gyxoa/QIFG/iPlwn75xpV8curv19o/N1+qJFfy72ugJ+ekPZN6VT9B+n/
	11kuel3n9GIQTHzpcht7pKQda2ku/TSQDPPPeea+8ctoGp41aWuWfl1FbwOu79dhDwSqH1/YVw0
	tpIlaCX9o6kflalV9+PNK/Yn27Jj3vjNLmqPglbF5VaVWseSqaTS0LmOvQ5tSK+/pVWjSODpL1V
	PJe5PkNBRuFvuCsIIBEiIOhUl6p+UZjH3ylIEMXHlGwp9SnyLmPh004Cm0Zf64Rn2+0jz/xpRai
	s6zkSN9fP92+LcCQE7XrtRL0iHf2r0twfxc0D8x5VxqHJk9QNf3wZc8sH5/tN7wJg+ngmMijhfZ
	05pNflXS3iSpY7b0vo3kFLctUAeaRL3ZALSflC+JzPx5RNPdCzyYTuhMjqbkfGDvDv3A63NA9tD
	PhZpfkOVH04rtjgmYgArKCkdaKbOWeyttglNcKQ8B0IH+Ptug3TRuUZRB18YIhP85uy0NTm4lSi
	wxrgVwei5wJBYOHNW2a1DjscqneDnMyFfW2OE3jKupi2D2pBLAd1XZa6/6wfzXP4PJZneHugpZx
	BgnALj0Ul35CSWOJFhhkDxy+clnXMy/y0ouAc5ZSUCLfBKIrrSzorGqEOVA=
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr18609420eec.37.1795697613902;
        Thu, 26 Nov 2026 04:53:33 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm30921851eec.27.2026.11.26.04.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:53:33 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	i.maximets@redhat.com
Subject: Re: [PATCH net v6 1/3] net: openvswitch: read the datapath features once when sending an upcall
Date: Thu, 26 Nov 2026 07:53:18 -0500
Message-ID: <20261126125212.sashiko-v6-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179561838178.3135.17043215376942642309@kernel.org>
References: <20261124145033.627044-1-houminxi@gmail.com> <20261124145033.627044-2-houminxi@gmail.com> <179561838178.3135.17043215376942642309@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

The comment now says "linear copy length (hlen)" rather than "head room".
That is the value selected before skb_zerocopy(), not skb_headroom().
This change is in the local v7 candidate; v7 has not been sent.
