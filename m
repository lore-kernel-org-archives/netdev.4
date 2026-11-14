Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642802;
	b=oscB+6hWghJBdzsa4kNtNR4taVKW1DxvHKCIAyPoKU2mNdwND+9CABmIQWcUElauZ+nv
	 6zmj2bMoXTinhWeYDaen3n/Noq3AHGPx+O/ihXYkD8v3Eg+TwXOSfHrHm44oVQCAYX92+
	 wah4PvFX/4gYZ0jMYiFnFNkGMImPDF10QtnsCd1J3ajB94zanPA6VYhjh+gzksrgKpZRo
	 CxygxhCa/XKx4wLp3DgkcMLzbUyFmBvA+gg1DXFuPaddKwNLbLZjRnHAhhgSOfdwcdfzR
	 zdRPX853hlESI8Co+T22PvPtRsD+mJM89xV0bQQWa3tua7omj+2Q1oX3An0AjJgmvDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Oh/mhrRlY1hzHfSankT6HJSljxVCxzPE9l8vrGjjWKk=;
	b=NgmWLMihTEPNHnCu1eZ/35iGqaKIpTKH1KSF5c7pPq+m04TFyduKj5E3oc9z5vGpPtBv
	 D8Mut3aL/zWwmdqPg51MejnwkjHUiOFjg41VJ1wHUKlHz5lEklRLJA92k1FJu36zqBBXf
	 mbRKBnznfBUa7aofmzNM7v+keHjLd0WHICckH/hn9a3ykbNQmBBeD5EoPuOO2UEfJGuQ+
	 X60BFUjKuo46RRvahnHqGQpQy6647U2KS7Zs8SVjwUWPUBCBc7KMMcisJikR5xv9HSdqe
	 YnYZrXyTMetAFeLhYncsL5ZyvOTPnxqwFLsALGQAWl3j1mXLQz0ysGzNdujMs+73cBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EU9x0Gyg;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE51606A332
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE51606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EU9x0Gyg
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso1321219b3a.2
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794642801; x=1795247601; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh/mhrRlY1hzHfSankT6HJSljxVCxzPE9l8vrGjjWKk=;
        b=EU9x0Gyg2vYJ4w09VNBpcRpLNQY5npITXlcuv3IY1iz7pbjExj2p2a/uvyEjaerkum
         K3mRfpTf0AVzKmESFuO8r03c0KbLK+tlW3f6nn6NlER3GknKiNj9Qo8Bi0TUOjyFFvcU
         Zo1ME4iCk5i1v9g7BtoISgq8PVEhp/H+QhWIEnl71uaTLhyo7VaG0OpYXcU70arPf0XW
         4X4ePACjTLy6LozsiGGxVM+M/14WI8XmQRKtt+Q/VEGxAc54af3HNOgvlEgXzEs8Ahzc
         yBUuzyh0a/kMvrgtGPTpZSBpSIIfe2IW7MSKbnNrpOFdQa05EtVmZrJ11NDiAiDlmK5D
         BvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642801; x=1795247601;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh/mhrRlY1hzHfSankT6HJSljxVCxzPE9l8vrGjjWKk=;
        b=V+wR/kDbItkUffkX9mg7roXuE0RXggKgRwV9dDa+r78NAaFwmf8omkA7MHUesOmof3
         +SgnnvcTdSZEoyDQ8CANsxe7UFVtdZsVfY/5GNoiCF9c/t5whKncUOPAMNXUttj7FbMl
         s53A3TYkWjqd+aA9Tpv5ae1V1GaJ/iaWVxbvzpyWYfgPoTrFjrKL3eFc0bfeH1PzEnbf
         8E3G+Yeyns/HhGSQP+hyl/MRsZslge0syQNVft8eXHnJHVqTOIPzTsjF1AQHFDm4roKM
         4wKr9uVRYy/9zMJesiYbEYO0mB7EiGp3x91oZJiGizxfNkBn6kse3ZAm3/fAHCZfdwSB
         Q+qw==
X-Forwarded-Encrypted: i=1; AL+hErGIBrfOJRGA4UCmZJ4H3hw8fDl6u2eVCW9CeS+OxFq6+mfxL7IyjxtK1rQPDKc2Q4Yxz/NETMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XVl9JL3sOltZGs1yPSdRWLoZGMIqKqiZcObgSFxVi4i/JS6Df
	4uLDI/bLlhf4B5qru9+eQp+4BrpV9nxL+SeDI9w7EewODyJn+5/HmbcksfMVs3w1RGdSOn9n6up
	ZdSdxkg==
X-Received: from pgij15.prod.google.com ([2002:a05:6a02:840f:b0:cca:d82:90fc])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a382:b0:3f9:9114:8045
 with SMTP id adf61e73a8af0-3f99114b75bmr595819637.43.1794642801339; Fri, 13
 Nov 2026 23:53:21 -0800 (PST)
Date: Sat, 14 Nov 2026 07:53:20 +0000
In-Reply-To: <20261111225148.88506-3-sidchintamaneni@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111225148.88506-1-sidchintamaneni@gmail.com> <20261111225148.88506-3-sidchintamaneni@gmail.com>
Message-ID: <avgQgQeWDfQMQgvl@google.com>
Subject: Re: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 22:51:48 +0000, Siddharth Chintamaneni wrote:
> Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> observes a dead peer in send().
> 
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> ---
>  .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
> index c165f250220a..ced83d3173b7 100644
> --- a/tools/testing/selftests/net/af_unix/scm_rights.c
> +++ b/tools/testing/selftests/net/af_unix/scm_rights.c
> @@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
>  	close_sockets(6);
>  }
>  
> +static int count_scm_fds(struct __test_metadata *_metadata, int fd)
> +{
> +	char path[64], *line = NULL;
> +	int scm_fds = -1, ret;
> +	size_t unused = 0;
> +	FILE *f;
> +
> +	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
> +
> +	f = fopen(path, "r");
> +	ASSERT_NE(NULL, f);
> +
> +	while (getline(&line, &unused, f) != -1) {
> +		if (strncmp(line, "scm_fds:", 8))
> +			continue;
> +
> +		ret = sscanf(line + 8, "%d", &scm_fds);
> +		ASSERT_EQ(1, ret);
> +
> +		break;
> +	}
> +
> +	free(line);
> +
> +	ret = fclose(f);
> +	ASSERT_EQ(0, ret);
> +
> +	return scm_fds;
> +}
> +
> +TEST(dgram_disconnect_fdinfo)
> +{
> +	const FIXTURE_VARIANT(scm_rights) variant = {
> +		.name = "UNIX ",
> +		.type = SOCK_DGRAM,
> +	};
> +	FIXTURE_DATA(scm_rights) self = {};
> +	struct sockaddr addr = {
> +		.sa_family = AF_UNSPEC,
> +	};
> +	int ret;
> +
> +	ret = unshare(CLONE_NEWNET);
> +	ASSERT_EQ(0, ret);
> +	ASSERT_EQ(0, count_sockets(_metadata, &variant));

nit: count_sockets() is not needed.


> +
> +	create_socketpairs(_metadata, &self, &variant, 2);
> +
> +	/* 1. Disconnect via connect(AF_UNSPEC) */
> +	__send_fd(_metadata, &self, &variant, 0, 0);
> +	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
> +
> +	ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
> +	ASSERT_EQ(0, ret);
> +	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
> +
> +	/* 2. Dead-peer disconnect via send() */
> +	__send_fd(_metadata, &self, &variant, 1, 1);
> +	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
> +
> +	ret = close(self.fd[3]);
> +	ASSERT_EQ(0, ret);
> +
> +	ret = send(self.fd[2], "x", 1, 0);
> +	ASSERT_EQ(-1, ret);
> +	ASSERT_EQ(ECONNREFUSED, errno);
> +	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
> +
> +	ret = close(self.fd[0]);
> +	ASSERT_EQ(0, ret);
> +	ret = close(self.fd[1]);
> +	ASSERT_EQ(0, ret);
> +	ret = close(self.fd[2]);
> +	ASSERT_EQ(0, ret);
> +
> +	sleep(1);
> +	ASSERT_EQ(0, count_sockets(_metadata, &variant));

Same, these two lines are unnecessary.

sleep() and count_sockets() in FIXTURE_TEARDOWN(scm_rights)
were to wait GC to purge cyclic references, but this test does
not create that.


> +}
> +
>  TEST_HARNESS_MAIN
> -- 
> 2.43.0
> 
