Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556716;
	b=Vj4g0qMu6UkiQVO5T05pifwPflzU6j1bvycD8yZEoXlM/1ksg/CJPNBfTcBsVzl4JN8V
	 HF2yUC9RJcmv3TB7lQcE60cVle3Y/B6LmoBMU0FCNCDVQNeGcTqJSvbZRUl3d9nrMQDZc
	 jJBltJN/UJRiRtICfnzSmjny972qklmiJIry4sx5EiAwtw5gvhlCZC9+UQrkhOEfxTpt8
	 3tOpmqhCoATIy/81mrPLTiSC2AuGv0l+4yDb+8PrZLbgiEJhnFRFHfY6tr9dE8uLW8jXR
	 ftT7x4k3hIZX13GTVXgTiAmQm4ljFI7+zos0RnH6rRl/jBVyRtfzEKaeeYwHR9vB0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
	b=RcSdbgWwGpeIDyPcFfnvsDQZvChuEWoo3ZpzxQi/jEC/ZzPdccHLxOrO8agJnsQ+pLgF
	 Vbq8M80kGuEFwqfhPPIGQ0AY0EUVRK0Iu6yOixJpVKwCwKOLvhVvK9iHhrHbzFd4nQl3n
	 uSm8G9irQiOdPxI7fv/4YHMN4b8t1XJZSuDb+VCWKF/Z2ncY+4/WRUmvvG6qS1YJ88avS
	 U6B51p9+PFKX9Y4CC66Cx0/U3DREtY76Fr4ogHUX0M5VW5jE2MCdVk9kyxzPYcCGj+HI4
	 OYvxcvqJacaohXS0l9aQ6JWr/bmykSTwwrhbCbymtfGp/qTOjNaDH90vFXNdebuBdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/Pk4GYk";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B52606A683
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B52606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/Pk4GYk
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so473155f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556714; x=1796161514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
        b=m/Pk4GYkd4a0n+3Ofirfb5f+ITK8dBGDcfib4ub3zN7yISODpaZZ5mJ5xBGmohTMYt
         HC7ka87JswHaOTPQyJ2T/rBoIAHPU9Kte/ev8XNaH+LB9KAFn6P/J5WfJaMewXaCyVEG
         +3yJrJ2m3ARt37tDdBCJe3Ox2Njb1uwPHBdgPNxtWDoFpF+iLv0VEeCkzKO9gPk5IDyH
         q6AngNbo4UkQsLr0pz0cnQuMxwod4OQDXtRK7gTiOmWsqCUJKO97VGkdDcxNG6QVk62E
         XC1LvLd9nXySVrMogVq4z3of5DmjXxYhi61MhUGmzZ/xNFo3niBYWfIP+9FY1iLgXvmZ
         V8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556714; x=1796161514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
        b=fDT6vTTC0mX/v5OCHtYyYjZ7ML48QJYBx1vqMiNCdRORGw4ZnNc5EC/qk409uKy2lo
         90bS9gmhnRWAOcny5SSsLmBPyKxMnlvvIl7192+1eeTfpIYlVFKIJp4HfH7EgoTUhYsV
         SNsGHeWRFUIkjrkO3dpZhkeMHdMjVRZOzqKuAmvR68Ned4wWPn1+6Qi4QR0216u89uLm
         GXvPXVC05EW8Xhl/xCQA1ebI3Avg0bAD2znyFWls7qvcdLUITCnKZ2VXQ3j6hny1SPCl
         DMe5PX/55vfLbVXV5E4ps3SnAccMkyOBy7vQbAcd6HJZeF8sYMt/ROy2ehgRwuhQBYfg
         EHbg==
X-Forwarded-Encrypted: i=1; AL+hErHzbbrT8KbZCKPE5NuJPR5SV3UC5oCLIioPudSHU+SU/eSoKAJB2i+OhOT3vYVReTjnVb85m2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/hVSyQQN4ODkIi+iaZsrdI3PLp3wHDoc971YEzZamgoiGWWpo
	HAYhFiMVdwxCx6okdnY+BgPCrddtug0MzIcnxjc1un6hdjpOj6IM8qLK
X-Gm-Gg: AZFdTZdBjvgfxTSjnGd6GJRdBfG4m9sNqURsn6mqguYagmsAuCav6YLio4UcO66w9oe
	o2Is3/pgnLg1FdPtHVK3Omv7EOHijk4/Mo0eH2ZVArH07D6qQYpJqjVQKjGDrkAmQ32uSkfxwoT
	89i6HjwGY90Ee19xG9puWbTDlNWf7UP7BqaTQLwv5H7KvmkmGc4WpfKElHaVRAnGEDYj44e7F2y
	z0sutGSALluU6KsD1GQhgzZeLh5Iv3xfxGPLoYnMsqwPdGpcaQxXSr8RQvhfAQsRjSschZyu8nW
	uHNcQzo/Wfs780wTK1ULtAGz6BoF9la3GqM3jtvfOP1VRMhOBxBzuAPXrW22UW8m+tPvFu31oQX
	bw1JOirHrUFZwdJS14pMdQC7yKaqvGI9aTCqGtFPY8PHL6YzxbesHXQQigBsWoig62/IGTN/cDi
	D4BD0hqZ4zAHysFCPyrTDS+3jkrcIGUkq80Yg6lchNEwceHymykPFV9r6CwA31B/C2Dw2DSHcXG
	eSqApdQ1IpdBvZmpBaHQgYs3hdZqHvFFN2t4nFKo/pHaO076aX9P5lyEBb2JRC8JOwCBepAr4is
	ndWZaJHkdv514Q+/4LqlbEem1KeEcXThg4Cke4HSilfXfUmYPRuVdqRQDDWxB7Mi0HQ9dQ==
X-Received: by 2002:a05:6000:184f:b0:4ab:cb33:9b87 with SMTP id ffacd0b85a97d-4abcb33a2e9mr33409232f8f.5.1795556714219;
        Tue, 24 Nov 2026 13:45:14 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm29025201f8f.40.2026.11.24.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:45:13 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: hangbin.liu@linux.dev,
	tianyi@cloudflare.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Tue, 24 Nov 2026 22:44:58 +0100
Message-ID: <20261124214458.12800-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123052207.GG10218@Liu-laptop>
References: <20261123052207.GG10218@Liu-laptop>
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

On Mon, 23 Nov 2026 13:22:07 +0800 Hangbin Liu wrote:
> This one and patch 2 are fixing the same issue in the same test.
> Why bother with two patches?

You're correct, squashed into one propagation patch in v7
https://lore.kernel.org/all/20261124214025.11603-1-emmaonana18@gmail.com/

Thanks,
Omokefe
