Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780173;
	b=E12JgdgepSwimqgRRMbdt8fjl75EbJt4Ccl0FhcL2px2u+qJ/Av65PqIiShuiFBF9jDG
	 Zc62dCHhNdKXE08i4QN5QSFbQtjFemoPUPlYXrW46qjNPLgmNBNuhStvDYeBFh0KCPTsA
	 Q1rMGLoGfkdiLyANvQRLk5siA/AQ93GGgPD9+sjst1iZiLf9ZrHRF6uokrfmrGmhW3uQ0
	 QjNaRSp3CzBw7LxaUkzALzpjKI9ERvDp7VbB31FXCZg+6L4lSrp+jhZPe4dYoqc9BE7Fu
	 M+0KKghNV8rLBfVAhj475d6pQIIL8LmnQ8W+jhJmEaf3sNscRAW6m6EE89bzHVdI/gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
	b=lLBoiv99K1rP22zExXG4FCvZwef44vKp0skYtf8/Mdd+hXcuVOrPvEAhLJS+yrxm14/s
	 R2Br9IIUj4ji2exJzGzFtT+kyxbIrIFOm0k5cCCP4BuNYmZfK41YYZMvDLeb1nN/1krng
	 ehtm3kqV6qoLEkslIpAzicTxLX7fhppvaQm7t3fuqJzC5NNqGp9lJjptV5+w+kwqCkvFe
	 /MHvs2K6XVNcM46eHqNetUXDEKoKvPf2nGssm6Swq9K0Uz7YfnRoO3rBzN2MebyW48y69
	 mehZNNzxSwMUFkGijIS+OjKfbhv+sAHl+YOGOHv6S+cVO4a52Zea+YSSsIQw1VS3RQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMa6qxkq;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C5606A32F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6C5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMa6qxkq
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49083b985d2so266099f8f.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 14:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780172; x=1795384972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
        b=hMa6qxkquxLiBeveT81zF68GYb6CJxnvwU7kp66SYWYPigJcJHz6TmqT8tw5C24616
         bubH74AOXFvkcsGJXAFfX+ArBiWMUTVrjwhG77MzAp//sMX8SaJWiVMX8xbugTLpX139
         ZD3e/ooXqnWaj4k3pqkQZ7Ft7ethobWskQqXiWlTzPS6FzQTbXTCs9YNkLUKd2FIgb6A
         i9BZFyb0uuNX+i/i8CL3owRjg6mEGQGAjW5xHEdX0acwezoshJsS98dWmUMYOXQwW5HQ
         H24EeRiAZMJWVXcOJLOP3bGlk34c+aIjKvF4zN+3LAEJCNcrZVfT3bqNH8kene/rRrWM
         7VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780172; x=1795384972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
        b=JRF3JyW0iiBIEoLL0g/9vCX085zIFS75Lkkk3bX7Lw7+MOOSrqHaIYXoSLQ61okaWf
         ZXI4IjH2iH6daOjz+27az+KEZnHOrOKZAlmBYstalut8i5lmHXlSQRDzBxV6bCEax+S2
         MJwN8vdW86iXyVzfyJorczYMEUX/XFkIulEERyQP1wDEKuvsvK2NtSTyad7igd1Evrfp
         ccRdKnDQ/BR5LNunKISNVp8tktWcg/h77TZqF/bt2ttXGbJj2cAvIyJ6SvcQTvd8CUbJ
         5N9bvcuoSKLP3qs9rBXEsbNHhhNf5ogUp9pYiefu5mQC4uLff9pJMG37ulD5dCUmYBUi
         nvXA==
X-Forwarded-Encrypted: i=1; AL+hErGbLsXe6jBTzWmkEPmUbWGY7VMPL5XhgHSODj+9KJzWPm2ZnFKyKmrcuCd0KKCui2f++KlM/JU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oAPUNrFUijIHJwbcZfuf1IjBcG5qahzJqzOtD0qYL1vz+khsl
	u/RI9z22zeszC4tHIRNlGJP4VTwNN54e2637ov18Kw0HqLjZVhtmMKBz
X-Gm-Gg: AYBFou2dgWrefqAHll/W5hclj2H4jQfw627gIBfX23w+t1mben7ZTLMv4HIrFdg8lP0
	X0CSMqSu2l+ksN7hENB0A4Tyj6jRbzWYfLcpTZv3jKSOdb00CDB9DqzOO31HmuK7mkMmlyJsCqg
	/67JE9T7hL/M4PEghCA71BTh4nJXca0GfUiQ7Gxwkcs5rjaW8daem1rTzAhe/wYEo+NZV1HNOIu
	PMUlL0hnGUTqIakvOpGT1Jvw0IQMh+xXpfJLyEyzvHB64YvLMXT05Hv399MYOpaW9GlKQDvUsOJ
	zAedtaN2mCDq2lEe3vH8S3qK88YpfZsoRezeBDlglPQARKVtBaUQYP420sdxnb9r0Kt4CWjpzBM
	rGMLz0J3pU7EgxtGbhRy9eliH48jWC7f+6sYfxbHbK0KqTwSIGdacRyeX6E0mOEzIDtNP/rZeEL
	L51ZNwJ0F+X3DjjAPeptvnQpUI7vChereA9bgYtiZ5Be1peywRipl6KEVtVoXDi7cdRXFokw9lQ
	YjpRrAYqpR8QfU9mo1B5ovNQOHiutl+kTerD5JUGAp5fJQdxLhOoPXmnYQW6gjNimtcMtHH6Bh/
	U+cMcDaOBGbXCNrfAQnsvYXx6l6iH0LWGYGNDBdnOSYo+RQUUPsyY6ZcdcwNwnJ7oQI3PKrOZQQ
	9KwsQPTqsu+Y6WFtfL/o=
X-Received: by 2002:a05:600c:8b74:b0:4bb:6a02:d42e with SMTP id 5b1f17b1804b1-4bb6a02d56cmr58017955e9.1.1794780171572;
        Sun, 15 Nov 2026 14:02:51 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm9320665e9.1.2026.11.15.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:02:51 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org
Cc: davem@davemloft.net,
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
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: Re: [PATCH] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 23:02:40 +0100
Message-ID: <20261115220240.51713-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
References: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
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

On Sun, 15 Nov 2026 21:34:29 +0000 Tianyi Gao wrote:
> The Fixes tag should point to the commit that added chk_channels():
>
> Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
>
> c017800af5c7 did not change this helper. The bug is present since
> v5.15.

Thank you for confirming. v2 already carries the corrected tag:

https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
