Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571375;
	b=Hla8I6YKc7q/SsI9PnE+d+FAuAZVObR11zcDHftkbKagZWXvpINHIgHzBkheZDV8kn1F
	 5mHYSAD0FJ7635HCZJXPr1l5E7dqOZZGvcxaGTffv58kOtU/cCksathbOyhI+iiqUkRvT
	 f/iRmbB03z+mZ4K8am7hyr1u/xwZpAd78Y5JmLAil/ijvxRa6nqAdfcL/M4gbWBTn1v0c
	 +7e4Iayy0BD99usAz6CZPWmtkJNB1+vDRs1JQIxGfJNCbGW2fLM6CT5AJ2aJ2xeWX32wQ
	 V5jRo9j39awn6o89PoUfi8BDJyCuxQ7XE6TcC7L8C5ELuxgX5k83vHYy11a7XoeQOOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8TeXfJ27+SQg5Dch5cOPtWUH6U4XsoE3KEGjDoF40p0=;
	b=4hupX6IR6qMz2VgsvEZ0h7MSrpNw9/fnYzmIB+i5mOia94uK3AxRqHzj1/Wnqzvpf4+z
	 4M3FHdGk2YtXq7BjZ2wtUDZtPM8gqRZJ1BFpxFMg329wkHU0sbw32LcmWr12OmrlA+WvQ
	 oS6xsLYJvI9xOVialP8ceWzrv01ggA1CVS1nNAf/vKoBAIaKvZ3f6qYlZzhgDRgRNQiyj
	 KrAJzJFT9SlBlOIOpr0mjobCmgRaA/RRBC3jwRAa11PZzPIb2jcb/zYbIn4QaaGgdilTZ
	 bBKAJF7ZQimPqASB0uFa71yGzXKa3pZ5dozhNWWzVLBrsAeRCuzGuN2bTBuwPJHUqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fn3f4IGV;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4045606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4045606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fn3f4IGV
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a07078200fso2697634b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795571374; x=1796176174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TeXfJ27+SQg5Dch5cOPtWUH6U4XsoE3KEGjDoF40p0=;
        b=fn3f4IGVOVIcK7vF087neS5Xq3Hpd88NAIdZHcg9ZrqNYtELT/PxMJod7mZ1oKpksD
         1hhlMeFt0xrk9PVNvh1cPErajWyts/itR4KN6OmN7i+ADoKmGCSELxufw4DJtnTBEgPl
         h/EZVifdGEkje0D3V2IfSpPnlF6/8UXnqUt5jFCWz57lBN09Df1EEyf/Is3pS4U3R2P7
         5H4ZzyL+8HW4A55SriJYJMtdGk0yWeX5ohBAN/nSQk8pMzSftNtmYHU+c6oQ713wRI6h
         iqChkbnEW9V/ZFKl5C5apAZ0lR2oBqT/qi4gTznj+92HMne1mv/lm3VXm3L+B2i1+30s
         ahdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571374; x=1796176174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TeXfJ27+SQg5Dch5cOPtWUH6U4XsoE3KEGjDoF40p0=;
        b=Cn57GuAxHYwXcZlSAcTWC6iQ2QawIDkvHgqEriy6EUJ4h5XsmoaqNSUHL+f+eqiiBn
         AKgoBmit3/SjrquzZuhjsE0PJW0Que85F7T+kixsAU0Xn0k6IlWJpn2dsv2NgHIhBVjm
         PQVyptbwELZk3l16tn8ll8B1lJNOUxojiQSPuelewStKczc2eVdnz2qSoT3H/bi3Wc2Y
         u0HvHhR72UIvwHEZxJcaqYxWdXxz1r4qX5YyrSHKkPGi5EXyickPJyvN1aXrlhXrlbg8
         n2SGxe+qNQy7R0zsqE5oyJ273Gois9gvIJ7g7US8d3mObnRH+IFbDySmkmUDcUNwX8s+
         zSjA==
X-Gm-Message-State: APuU4Z//+kOplkE1GO+Cy7lioSAp8SDEiXsWBSaXQ7zOaVM43N0jUina
	G/SWpXh71dXtf1gk7tNlzebP1eKXxTjuPkf5ktbuTxXbIo4LjZrUmWquWg9j1QPSCa0U1fiRZb/
	+zE1onAY=
X-Gm-Gg: AZFdTZeOFpKMUPfCyHBzt1q8YMD7N4OBWhZIGfDCXmstwNxTHledXylfj18nzp23feo
	06GAMtJHEibaqX2gOKIateg2VOEelvi/+l338UIH19R+ZP6SXMFbShUX2zc5PQD9qdUFm2Q5Hci
	ih3rbeT6U0Hb1Jj4kcpDT8sAhz1RiFSmjUt4wFKwdXcIja7IbDwg26bVPP/qKcWUs1P3dmHUwZq
	GmE+ZdvFR0hPTXuSXnkotuyI0PQS/mTlxJtqufw2rFm74OgZ6Uz1lGRU+sVuHbftoivbWj0Et8o
	r1TnIwvQwDoiU3o3nvbXQhuf4B7j43ooPzij/Cg4m0mm9gETwjE8SdO3xA87u/F9sPR+6Zkae8o
	BIV3NBZjDGfx7vlyYqUgn2e0ccNyCRieIUBNQ5DhGSt7489IQ0nKylLH5CrpY7Cd68ViLjyx3MB
	vrWASkp9GQ4VniOr5s0mZnA7F/Euc2FslXHG0wanZ99deHSK+GWstN+nznCYTsU4EC3SrhBYH9i
	hwRRdm/b0cFTqBOahjQi7kxIupBWYhXpUqdWJd/u+a5cWCZMR/vJaHlJAxKKWWHXl+dKOZoGkkB
	XZl5dpElv0HYUaDdFHxihhlnkirwVwBjpc76hN+7aOW9HDFHe11u5SZXdJrepP/tEQse
X-Received: by 2002:a05:6a20:430d:b0:3ef:ee8a:5201 with SMTP id adf61e73a8af0-4014a276b2amr16237334637.4.1795571373898;
        Tue, 24 Nov 2026 17:49:33 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm7784680a12.25.2026.11.24.17.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:49:33 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Frank Dressler <frank@dressler.pro>,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH v2 2/2] ss: build the socket cookie with a single shift
Date: Tue, 24 Nov 2026 17:48:27 -0800
Message-ID: <20261125014929.338108-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125014929.338108-1-stephen@networkplumber.org>
References: <20261125014929.338108-1-stephen@networkplumber.org>
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

From: Frank Dressler <frank@dressler.pro>

The split shift was necessary only while the code used unsigned long.
2e7e805d0aac ("ss: better 32bit support") changed it to unsigned long long.

Signed-off-by: Frank Dressler <frank@dressler.pro>
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
v2 - handle post ss split up

 ss/sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ss/sock.c b/ss/sock.c
index ca243f18..879af555 100644
--- a/ss/sock.c
+++ b/ss/sock.c
@@ -12,7 +12,7 @@
 
 unsigned long long cookie_sk_get(const uint32_t *cookie)
 {
-	return (((unsigned long long)cookie[1] << 31) << 1) | cookie[0];
+	return ((unsigned long long)cookie[1] << 32) | cookie[0];
 }
 
 static const char *unix_netid_name(int type)
-- 
2.53.0

