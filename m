Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933586;
	b=jRW/R5YnDX0lAEDZi0Gp9uSmTbmBNeAsZTv4BY2kr/jIJB38YLPix9stM/cz9wi7A7Ma
	 ws9mLTQDPU3SYRBZBsFWXM0xDCYDZGEZD48pBxwIaoNIgvUL7DVHhBTzO9aoMAHEod7XD
	 uHNgYEg3xnhiHbTLklJGMxkvv7j2+Jz9+WeSv3kMI2q3/aGTBcZO7GSWSxw9L/CscoVV7
	 21XnoZZDOqVLjzIa8xHUHiAuUL4NuA9mPCMJ9tuI+Y4t8dUMqGAj522TFFGZ9RqPm/8JH
	 Yp5E5yfsbWb89/GHOI9dekkCm2y/Ihdg/TpuHy0goxhUcMAAaQvXI06gQOFtbPeHp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/4F+/UcRHsLof3SKLCHcEO2D3rsOio5c6X0Z/n2CUGw=;
	b=er5pALG0qU4AvXN6ovnThg3h3e84CCDDuNMpbcl1RivxY+pPj3izw9XLAOStUvYRWHhF
	 fLsZ+ZRsSpX9ncAVFzGWQpd2T6Mg283Xxz1Xaq45f2OgXSQA1xOxJRGltJAYpa6SoM+D8
	 XWTvhgbZrvkCJuZmsHigmpvsRKWBcQ1zliQN65MyMBBbSpbqztMLN5vE8lq51ItxOydr+
	 aEwKvHhf1ltH0fLBpqYysN6DJCsyXxvfuJGsEggrRemfwFTZ+HYDrVhSuiQmO/2mK5wZ7
	 emqyrOIctgMZK689I128rE8c3Q7skVQum5W3P+g6DWaEacDAfrsB7ziRRohVNVawh7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aesidvv/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03981606A332
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03981606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aesidvv/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so982545e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794933584; x=1795538384; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4F+/UcRHsLof3SKLCHcEO2D3rsOio5c6X0Z/n2CUGw=;
        b=aesidvv/tWkl6ucd5vcg63Wz+nYZsmz2N4tlcBii1a0qmPtAjMp1D0BkM4s+kG+7vB
         J6noIj6TWK8JvWnlx5tONCVc5j3eP/3iK2OHAG5vof+0upQH042pml3mvWUEkiPxcfRP
         lO8mEe7+ckrl+Zrw5AdA2xWssqKCewrjvs7Ndvtc7ukDCecZNF5qbMtPXV89adzyCt9R
         YW+A58J7j0x1VKABDKxSt6F291Iqt8oIM/AD/88BR7vE/t4u6g6RttG9h62O2/mU4HGR
         tGUZ+G2WE0dPiIgu0v4WEB29+nU/VuGMlE/IKAdtuefyOFimXgW3oDkqALQe6SaZZrVV
         QbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933584; x=1795538384;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4F+/UcRHsLof3SKLCHcEO2D3rsOio5c6X0Z/n2CUGw=;
        b=bwrPjsvVppGi/Ltt4zwXNWcnovVdwWSSl9OpFK2FvYc7ihkTD80/XQdR2aPjNyx79z
         zsy1Gi3wRD2I6ntqbThzWPqj7h80QCVeM8AhDG0KdeCYrKeJxEkrZmSTnFK0UwczpeBj
         z3kqrH8OPkOtW53UYTRxS1fGauSDe9v3TbThu3KbCLZ/KqSIGWB4N2La5Z6pOU2M04t6
         6lrRmuzvuy2vLA7GIGPuF1d3B7SMeQqyJWe4PadH032Q2seCALJXEKCHkclVUofxPtFy
         /hm9WSb2odR0fIpHgl4nLk8yj45s7XDrQHr0Vct1ABLpxpud2vWSMsXtL80r8jHqlztG
         9sGw==
X-Forwarded-Encrypted: i=1; AL+hErGJ4nkDNHsMYHmQSjcfpN1OXMM9+wR89f9wIirul9IrN9npnYa7NtVv7jb1g5fvJ5L/vc60yfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9xpHudreuDd4D6kvSqc/NleITzgU8Uvi/TsqN3qTgoxcEcO5H
	ztv6Tu76xw3eXH+neiiPkW1ZvPZiXKNUbKt5iAkQU7Xkw3csUwn7VzF5imgyYiRUKlX+
X-Gm-Gg: AYBFou095iwej+obe8JoVRqa72nZ/aH8dJxfkvTUU095LjRSXnstZYsXDRPQTj+w+MO
	iSuLiRIgPSAiqyIJalFQPu8T+jIK36UiFQfonlmRfZuV1e/EAx16WAL7WVqE9rnw4hXHy4bhJMm
	IY8ILD3Fhhff9aSYdPZR0sOTyWvUzszw4kfKfhFOZbOt+J3aruZDBDrbL3V67MrtBNTlzLrqAqk
	jCZ9Aa2WgjitQMpzdaFNUpupSmOBU6RGTGwKpUe8Z7TZT7WQX1UaTyZQjiHSXJqKwtmes7KvJ5I
	JHn3s1v+uqAM4ERp6LhbiYeMIaLGoOVCyTb109s+sOhvedBG7PjGBYL3gHzfW1s4BMwXC9Q9HeG
	w3dUOSwWg1onN2+tm/42D+fnfdO0r/TOgtFCKzs0hm1BuspaQczFYx0rUvDpJR1yd9B6d2aQH00
	bpJ4dtO0bqO6aJ2r8LNn0tMINg0jy+NlarQYJlgcKsKxlBKah49T+GuvLOxHBwM/bod+zF1mVb6
	cZ9V7FVOxXaQFmZZSQtZ3+cf4vVBgIzTW/itNQvAX4Qw5z3DHbcWqluqOIkNVZp49waI/muj9S4
	6VpVxwPVm7gh1kumjL/HYI5oibh0p7aG+cqmElWoEZBy3FTW5lnQ+IzO0bfdeYzvIIYC/VaCzcK
	+ptNzhKOTniL28eeiPncaK0FLAYxUMcRXT7zh06gPorjHiZNay7JI3DTi0ivzvvuOh1UNWJOGH+
	WCZg==
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr315125305e9.16.1794933584407;
        Tue, 17 Nov 2026 08:39:44 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:dd2a:c8cf:5d96:bf5b? (p200300cf572c2800dd2ac8cf5d96bf5b.dip0.t-ipconnect.de. [2003:cf:572c:2800:dd2a:c8cf:5d96:bf5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a38b9b986esm5481266f8f.59.2026.11.17.08.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:43 -0800 (PST)
Message-ID: <cf47c058f8944a427885e83214b8ad1c4268cbd8.camel@amutable.com>
Subject: Re: [PATCH net 2/2] selftests/net: check that a short SO_PEERPIDFD
 optlen fails
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, "David S. Miller"
	 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Date: Tue, 17 Nov 2026 17:39:42 +0100
In-Reply-To: <20261117-work-net-peerpidfd_short_optlen-v1-2-a93f56288501@kernel.org>
References: 
	<20261117-work-net-peerpidfd_short_optlen-v1-0-a93f56288501@kernel.org>
	 <20261117-work-net-peerpidfd_short_optlen-v1-2-a93f56288501@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-17 at 16:25 +0100, Christian Brauner wrote:
> Cover SO_PEERPIDFD and SO_PEERPIDFD_THREAD with an optlen of 0 to 3:
>=20
> - getsockopt() fails with EINVAL
> - optlen and the buffer stay untouched
> - no pidfd is installed in the file descriptor table
>=20
> Check that a full-sized buffer still gets a pidfd.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0tools/testing/selftests/net/af_unix/scm_pidfd.c | 51
> +++++++++++++++++++++++++
> =C2=A01 file changed, 51 insertions(+)
>=20
> diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c
> b/tools/testing/selftests/net/af_unix/scm_pidfd.c
> index cbe53fab44fc5..c26f055a19032 100644
> --- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
> +++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
> @@ -1155,4 +1155,55 @@ TEST(so_peerpidfd_thread)
> =C2=A0	close(server);
> =C2=A0}
> =C2=A0
> +/* The lowest free file descriptor, where the next pidfd would land.
> */
> +static int lowest_free_fd(int fd)
> +{
> +	int nfd;
> +
> +	nfd =3D dup(fd);
> +	if (nfd >=3D 0)
> +		close(nfd);
> +	return nfd;
> +}
> +
> +/* A short optlen must fail without installing a pidfd. */
> +TEST(so_peerpidfd_short_optlen)
> +{
> +	const int optnames[] =3D { SO_PEERPIDFD, SO_PEERPIDFD_THREAD
> };
> +	int sv[2], i, free_fd, pidfd;
> +	socklen_t len, optlen;
> +
> +	ASSERT_EQ(0, socketpair(AF_UNIX, SOCK_STREAM, 0, sv));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(optnames); i++) {
> +		for (len =3D 0; len < sizeof(pidfd); len++) {
> +			free_fd =3D lowest_free_fd(sv[0]);
> +			ASSERT_LE(0, free_fd);
> +
> +			pidfd =3D -1;
> +			optlen =3D len;
> +			ASSERT_EQ(-1, getsockopt(sv[0], SOL_SOCKET,
> optnames[i],
> +						 &pidfd, &optlen));
> +			ASSERT_EQ(EINVAL, errno);
> +			EXPECT_EQ(len, optlen);
> +			EXPECT_EQ(-1, pidfd);
> +
> +			/* No pidfd was installed behind our back.
> */
> +			ASSERT_EQ(free_fd, lowest_free_fd(sv[0]));
> +		}
> +
> +		/* A full-sized buffer still gets the pidfd. */
> +		free_fd =3D lowest_free_fd(sv[0]);
> +		optlen =3D sizeof(pidfd);
> +		ASSERT_EQ(0, getsockopt(sv[0], SOL_SOCKET,
> optnames[i],
> +					&pidfd, &optlen));
> +		EXPECT_EQ(sizeof(pidfd), optlen);
> +		EXPECT_EQ(free_fd, pidfd);
> +		close(pidfd);
> +	}
> +
> +	close(sv[0]);
> +	close(sv[1]);
> +}
> +
> =C2=A0TEST_HARNESS_MAIN
