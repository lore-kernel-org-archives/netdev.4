Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794673381;
	b=jV1Gua6NgpaaeRvWALS8Rvlv7w66cC/FmzBudSZbI0h3DSXlxNpDBi3v1PPoxGA5TAvt
	 RMtdCTV7YRLwVo0qggDwg7VMUJEBapwYsKIr1PoZSsEnCpWEbhdn/HlY8AoAwFambQ0GI
	 Y8pO+BlWzeoKoWVf1aWVlLPAoISfluo3EmuIF+hCE7hQtAG6xgn6p40OEvJv/KmdW6fsf
	 YDleZ0/JsfRugwMk9MPyMlJU3KUpdf/rf1rrsw4gE1jWpvyrHSg7GpbCn6zDlTLACHPHn
	 +pF1UZ+JpzDry6cqkkocdBfZqjLYQEBIXy4j+s/wiEMUqIXo9pL9iZ9xK4L+VOTt2WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
	b=Y2Elz8xFLLsG97MCdczdxlrA934ynQJHtL1UTU7+9N7qiEeVng0g89VdzSPCwCZv0oTz
	 BWiEefJ3Eu0k9RZr9cK1uATd0WZ1FzSpZqxCwxoRj+ED1FmLuo3TWqdCNTUEszmChZV5m
	 C8RMiV1EiXlCvzmcp6mFKmbxnH2keE9GTEB/EYlv7CD2OiwCC8XdSICNTj9PUS8nbqER5
	 kxPgkamPmD3Bc7aeAd/bda/qOeWq8ss1oXQjtQxvUXga6nMJO0TQchzd1jTMnyGkeU0dJ
	 9Jh17/X5yEHcPUTqKcrtVjBsBcn5Rlqa7L3+0Nx0a0m5tM+wh3w0OJV+j59Vx1frSTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APdQoQCw;
	arc=fail smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29092606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29092606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APdQoQCw
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b331cad3cfso14753757b3.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673380; cv=none;
        d=google.com; s=arc-20260327;
        b=RZdti1mEnnD/Yz+qKY9TspUQ0Ns0IQKnkQli6uNfQo7/6qJVnvYtvwUHaEraZj1e1L
         lzsuRL7b3UZ/PZgcEf3s61CvK9qg5lXV6b1Iv6scvGnVtxwNOYq9DWDC5x8MUuhEwuKp
         ej2WdnAcGgBwVY5itmaMNb5acbFSqeJQf4k2o6qXcaK5GDH3tRnM3XskbImn3af/K6qD
         rXSTsS9WNSQif0nnNYp82/O3e8qWN4jK1XSWM0zxiPunapFljLsV4SFsECyi0biV426F
         Qnkn/n7QCme8CH/58KtLIjgGeXjTV4WALUDAy6ear7DlC9lM3OdGrfpqv25hI4pXNJWm
         HRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        fh=+jTRzWBV5IvvCk0x4O6uHQyZXz0y4OyrQwgEV7yZlWg=;
        b=aET+nbbSVgC2/myOhIGabwBYCDk4LauQCeHp85PHKeiy6kk82oGqkayUCI19fKphCh
         EgJvim366lq5uZaVdFamsqQER+Rvwz85LE386eGSC6naG1+30GtMabikGhfK1mNylegr
         HBgo2aoHGrnPsB3cZBECYrguWPoCG8O3i5Xhv3TlWIetWIg3VdfQAz8TGBb5z799xvMk
         bZs73rvKYMz8HVaxZkHImyWxc0ASHpiKlHBiOdYSC4fQ+RTZrHCdpNk2XqbeZTY+8A0l
         n9NRtzXdXY2+CjdWIRINmm2iwMleRGMgykBdMYf916f6P2qDm2D98TmawmYltSVPMPUD
         3i1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673380; x=1795278180; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        b=APdQoQCw4TyQgXX7302jy7sKpUOemBZ4YzjW5ZzZnDAbAXo2VYfez9gb2Z2Grl83Fz
         W3FFJxdzWvNY/LaiEUZtO1N9KaNikO+ws3FBIDmAJqOc27WoUMdtoOYO7JtMFGM0X+yg
         b76rLyjPDHMRxfSSFHCbo5VnFgW7kLgJRoHcJSi/1e11d1PyNXb1mgeRTZu93dOJQVmJ
         3igUdwJ2oiTJdZ9KOu5ZALJemocETQ/4NTyLnr+yxNd4TeqeWBDWX3dLyRFjnNZC31lO
         simp0koL5wenXBnHoooIMg08JPKufYY/c0sdBByBFAY6GvpF87jSGiiJQN4ynN4xSmXN
         fDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673380; x=1795278180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIrdsg15x4joWnwi7mHS0sRF/D5IlopS+RsU+PycYPQ=;
        b=FDk95yptd0h1h5xCG3YRGiiACPHzy/uZAgVhIZ3nHzGphSdHcuEgZh+rURq3lqrgyt
         YZJ/uRsIHOUROt9EDhJc7y+OL6sJHGe2omzZtCUS7fHQqR4rtIVw34mAH+I0gy9AxBbz
         ZFVZb0zMa0Rae+Iqq3hstjxCzYCSFlfahKzQXRZdwKBVBZryZ/ZaNsIpygUzmyicVCSA
         2zL4p64NyT4Yofw6dlYuE9XYTX1sc6ZSNdxVY8cGse3a+zFFjahiGn4sbD1vYrlbLySa
         hdFJujWIVgVRU/6dhOPgaKytpOsjRQKuCnIX3uQLbVDCBkrZef7OILfyiTkaEWcecP6a
         /C4w==
X-Forwarded-Encrypted: i=1; AL+hErEN4GQhBSyEfVWUu400++pirn+q57DP6MlgfislL5ks0BUgpE7y+6seQNOMfqjF+PBTfyy5ON8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bjotGl+b8oTpLI9/vjx10pcc7r5zPY0z9lvMbJDMvup/6XPyO
	N087AATVlAuz/ZoPSI03wjHnTZjodyRfaZWVKA2t8fWKXTiNLEWQ8qxqI0wg0pJBtkOkWGpxn+T
	g3Mx3FRS6T9/eR39IV1yyCLhORDkPfwc=
X-Gm-Gg: AYBFou2NBowtqB430eVT6JmNcxB1j4NvL3n4y/vNzs1oPDFJ5IQZen/zzAUao005SgS
	fMB6NcvAB29ePXA6zmNPuVfRmD6CCFnyyq9rRynLClc8R+vMFtiLhcnbZM+0m4/ErPpcPkwd/6k
	+yCUoNQ+MY+mDQMrQdlcxpVThKMafSlwPjo4tx8hBHlpj+aAiF+ynbzUMlvdKifWpq4n7xo04ri
	IMmKxWJK2QGBRPHe0NncX89aI6I0FGTFfi+iXafwYKZFHxtttGx8vI7jKCAfga31kHgq4FP9q+H
	3S9UH8FfDeeRWP2EMImEJPWUxYaKM54QjgvbRDAsXVO45qQVa1lH3nbxnozIKCq5P2uU90Bz5pD
	ysO/tzGX0vTYli4I+UrBJrsaiOv0lSItxYkdXQvTl2CaiTuX4sV4qYjcyi8daCYq6Fhwyh0J5B6
	BfnkxMCoqh37hhZqedhDzDmv+8mGb+ibXFvj0HR7sVEV17aAjUiavnq3KV8uKygTOxcolFSlbzB
	KreklEHmNwM9ctu3U6FcIurLBIlWD8=
X-Received: by 2002:a05:690e:1917:b0:675:a278:10a4 with SMTP id
 956f58d0204a3-67d89888ea5mr3886121d50.103.1794673380065; Sat, 14 Nov 2026
 08:23:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
 <20261111225148.88506-3-sidchintamaneni@gmail.com> <avgQgQeWDfQMQgvl@google.com>
In-Reply-To: <avgQgQeWDfQMQgvl@google.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sat, 14 Nov 2026 08:22:49 -0800
X-Gm-Features: AclHuK_8gEV-etDhqKooisr3RfW8V3KHVl580Th2LAmWabQ5EUshcJqxA7SCoT0
Message-ID: <CAE5sdEgGjK0x3QuetQaTycmtxUMwFf1aQChXyrQxZUkbX6uO6A@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 23:53, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> On Wed, 11 Nov 2026 22:51:48 +0000, Siddharth Chintamaneni wrote:
> > Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> > /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> > with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> > observes a dead peer in send().
> >
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > ---
> >  .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
> > index c165f250220a..ced83d3173b7 100644
> > --- a/tools/testing/selftests/net/af_unix/scm_rights.c
> > +++ b/tools/testing/selftests/net/af_unix/scm_rights.c
> > @@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
> >       close_sockets(6);
> >  }
> >
> > +static int count_scm_fds(struct __test_metadata *_metadata, int fd)
> > +{
> > +     char path[64], *line = NULL;
> > +     int scm_fds = -1, ret;
> > +     size_t unused = 0;
> > +     FILE *f;
> > +
> > +     snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
> > +
> > +     f = fopen(path, "r");
> > +     ASSERT_NE(NULL, f);
> > +
> > +     while (getline(&line, &unused, f) != -1) {
> > +             if (strncmp(line, "scm_fds:", 8))
> > +                     continue;
> > +
> > +             ret = sscanf(line + 8, "%d", &scm_fds);
> > +             ASSERT_EQ(1, ret);
> > +
> > +             break;
> > +     }
> > +
> > +     free(line);
> > +
> > +     ret = fclose(f);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     return scm_fds;
> > +}
> > +
> > +TEST(dgram_disconnect_fdinfo)
> > +{
> > +     const FIXTURE_VARIANT(scm_rights) variant = {
> > +             .name = "UNIX ",
> > +             .type = SOCK_DGRAM,
> > +     };
> > +     FIXTURE_DATA(scm_rights) self = {};
> > +     struct sockaddr addr = {
> > +             .sa_family = AF_UNSPEC,
> > +     };
> > +     int ret;
> > +
> > +     ret = unshare(CLONE_NEWNET);
> > +     ASSERT_EQ(0, ret);
> > +     ASSERT_EQ(0, count_sockets(_metadata, &variant));
>
> nit: count_sockets() is not needed.
>
>
> > +
> > +     create_socketpairs(_metadata, &self, &variant, 2);
> > +
> > +     /* 1. Disconnect via connect(AF_UNSPEC) */
> > +     __send_fd(_metadata, &self, &variant, 0, 0);
> > +     ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
> > +
> > +     ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
> > +     ASSERT_EQ(0, ret);
> > +     ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
> > +
> > +     /* 2. Dead-peer disconnect via send() */
> > +     __send_fd(_metadata, &self, &variant, 1, 1);
> > +     ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
> > +
> > +     ret = close(self.fd[3]);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     ret = send(self.fd[2], "x", 1, 0);
> > +     ASSERT_EQ(-1, ret);
> > +     ASSERT_EQ(ECONNREFUSED, errno);
> > +     ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
> > +
> > +     ret = close(self.fd[0]);
> > +     ASSERT_EQ(0, ret);
> > +     ret = close(self.fd[1]);
> > +     ASSERT_EQ(0, ret);
> > +     ret = close(self.fd[2]);
> > +     ASSERT_EQ(0, ret);
> > +
> > +     sleep(1);
> > +     ASSERT_EQ(0, count_sockets(_metadata, &variant));
>
> Same, these two lines are unnecessary.
>
> sleep() and count_sockets() in FIXTURE_TEARDOWN(scm_rights)
> were to wait GC to purge cyclic references, but this test does
> not create that.
>

Thanks for the review! I'll drop both count_sockets() calls and re-spin in it.

>
> > +}
> > +
> >  TEST_HARNESS_MAIN
> > --
> > 2.43.0
> >
