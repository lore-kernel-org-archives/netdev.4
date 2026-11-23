Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444598;
	b=Az14cm1qgOJkI4MfTssHVBPux2qFEpMuu4XTWnGUz6Xj02owm/c/20eDswFgQ+Fd+EHP
	 2Q3aUn1NvhOYBtsQGzLRv+bRsGNOZ9hMaZ8FBLdE2dwLnd6tOAsNZCeqUuI+qv/8zf4wK
	 IaLFt+3QB6B2CSBg0qgBZB4R1msLCSzx5SDhoaPElxfHRfmJO399wlsCBqV0JT4d93Kzw
	 aACEhjWZR3PXRIOQ9Sz0cAMcF0JnGqCGSCGtg/zZv1edM0bQlsIYpwG8mdy8XdYEbPtO8
	 26wqYeNKRRdOVcJDbjiBIEzgieqyniWSgLtEr+3OS+fBKrtbnpNv95AvD1ZVWfO6OFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c7RIFJ9JCRdyaG8UKVxLRWxNqNn9TfnyLCzHHvdNicM=;
	b=eObw3D3kOb9fkcbJcyQKfbf4S9WVoYS9E4PhiHv7uhapixTAAKSxUxntm1Ros2q11wCo
	 Ya6dz4ligp/hZTOJkLBLvsc6Nr/8NtG7T+T0vJ7xD+/5M3QhbAcO3PlWDafLLnHRn9Jie
	 Yn7SsdnznVMggE4MZqui8tuoHOJ+qi4D5BF0VzY/KXaqXsyE8oKIocukPNuU+LViKWDUk
	 XDIc12r5O9e6FidN0MbZRg6CxTVvxIMwS9VW7hIfQVl7eM1aP7XKWoB/GdefhG7Fi2DUS
	 GQ++ISWTt+LTJnTzbQNJbJ66m4rs3DIbR1FiaJo+lUoUYP8YW3GKESCz94xPGof7Pjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=HQ61VKDz;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B351606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B351606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=HQ61VKDz
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f037bc348dso27821345ad.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795444597; x=1796049397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7RIFJ9JCRdyaG8UKVxLRWxNqNn9TfnyLCzHHvdNicM=;
        b=HQ61VKDzJuSyLg0GiLde4RIIRMg54I5xdOttpoZvzcz3swdIwdA/eSKH7IrbCIaMFH
         1ftQy0jVuo5nXxQBRZcVdZovUXDtn1enquSp8suF8HRaLvAAz2EKh4Af0WRRUH4/wAlv
         esH1cGnI3PK8URfa4yjsw4UQA14K+y/p53Aos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444597; x=1796049397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7RIFJ9JCRdyaG8UKVxLRWxNqNn9TfnyLCzHHvdNicM=;
        b=i0gHqBuIw9HIJiieiFV/wLvLkadMaq8bbBrumK9q4OwiYIj/31yGJituRS+TPes5Fs
         KdAFhhk26B0DRx05XXTsr6gs6ohhZ7xObmx+ZEeC4bytfdJFDM2VaFFrVkyVYQc/jDZg
         8YQonDlnrxcVBuKDqcUgnzW+mMweDBPNrEZiab8tkxMU5SjsQ2aXAg04GSWN21Z+nKiN
         OLW3MGHtLxDoRIRcCwetbA7OkKxK4tPu00kX93QA295vQLvd0IippKNuaYbmb/XQaAkB
         8N+2mK3q1Cop4dFijrxvmL0RGCYmcLZyUfSdZ+oMC05p/VxYqOdBe/Tg7F3DoXmvTRgy
         qEyg==
X-Forwarded-Encrypted: i=1; AL+hErE3ezoM1lLuCEjMvAr0Y0FJDMn7HUtnZAfLwZs/7DCK8nCMrpr99eikjF5bhKzR1kug9QgarAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cffzlpZ2BBhUH7HblYx7fJKhaq2G1XiK/AI1hcxW1GU7erFnY
	csMYzAkHQAdtA6s5xj6HinlcxWU50gvKLXCMd9CX+NOiX8Lh0lgtwnnDvYEcwaYOqUiEFYriPUk
	xRpUjmIk9Zg==
X-Gm-Gg: AZFdTZcd4ksXK4G4DtDEg4kv4oIfww4x0JWQlLwKYwi61qZiQowDLqsMWyrNdCeSYtQ
	eC36sYveDmU8qIlgxW4RFXiXGYhY4ZJQsKk0RlXmvRorxMpXNHb8lsal3rWN+CDWjUxsqdH/f3u
	jwDQ4DQVAccttl2w9SayLEoQIbRsFPJ6nz6MQq3i/5j+FtSCYaZB89CnwD/zq6kfQydBW2joqzB
	t8XU1cYccJ3nbXBEQpI1NQwLjKQ1Ix3SKgqByF8LCuNExAIybEesr9aWJaWoaWA9x+9z+/QtRb3
	DhKG9xTEM3Y3dE9KqclBmmeFR1a0MZtRUZgcd06KHSxe0TahboEicKzpwL9nPA/RPSDRxGUZkiN
	ztJdK6XhJg6eei/bSwYexo728sHx2x85MkLT+qKipj4Xq+TesMpxh1qK/Q5ESlDU28B5k+VQxSy
	aOR6BwVLeUPqHFeLcybIRHjgNOOtO75CIJgQbloFf4HJ+NOg6tXJZJM7gz69zrIbsDAMCfXxl/c
	2RF8/Jr9PNE1MEZZR9oL9Q1z6/lAvbF/uEZwPdNZruwAnEst7/MnPBQ1hvJG22pnNRvceO4jQQO
	yZDhXGHz7Rf9PJXpyOxeeswebHYCqbTb7TkJDlTzTUT2tdZjsDiOVHEmcAfCsdt0L2OJgrtfVKt
	Bh35ULcCJHqp6AEiwFdqHwkW19Nfvo5r+/6v39gdFbXmjWuNAMtkw3kH5T7DITcKa1g==
X-Received: by 2002:a17:902:ced1:b0:2f0:340d:dda4 with SMTP id d9443c01a7336-2f03f1ec3fcmr143338425ad.24.1795444597511;
        Mon, 23 Nov 2026 06:36:37 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm54062085ad.4.2026.11.23.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:36:36 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	stable@vger.kernel.org
Subject: [PATCH net] can: j1939: do not pass a NULL session skb to the socket layer
Date: Mon, 23 Nov 2026 20:06:25 +0530
Message-Id: <20261123143625.4021586-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123143625.4021586-1-piyus@iiitd.ac.in>
References: <20261123143625.4021586-1-piyus@iiitd.ac.in>
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

j1939_session_completed() hands the session's skb to the socket layer
without checking that there is one:

	if (!session->transmission) {
		se_skb = j1939_session_skb_get(session);
		/* distribute among j1939 receivers */
		j1939_sk_recv(session->priv, se_skb);
		consume_skb(se_skb);
	}

j1939_session_skb_get() returns the skb covering the session's current
offset, or NULL when the queue holds none, and j1939_sk_recv_one() then
dereferences it on its first statement:

	if (oskb->sk == &jsk->sk)

sk_buff::sk sits at offset 0x18, which is the address in the report below.
consume_skb() tolerates NULL, so the dereference is the only fault.

A peer reaches this by completing a transport session that has no data
queued - an EOMA for a connection whose data packets never arrived:

  BUG: KASAN: null-ptr-deref in j1939_sk_recv_one+0x34/0x170
  Read of size 8 at addr 0000000000000018 by task syz-executor
   j1939_sk_recv_one          net/can/j1939/socket.c:318
   j1939_sk_recv              net/can/j1939/socket.c:363
   j1939_session_completed    net/can/j1939/transport.c:1247
   j1939_xtp_rx_eoma_one      net/can/j1939/transport.c:1424
   j1939_xtp_rx_eoma          net/can/j1939/transport.c:1439
   j1939_tp_cmd_recv          net/can/j1939/transport.c:2153
   j1939_tp_recv              net/can/j1939/transport.c:2201
   j1939_can_recv             net/can/j1939/main.c:108

Test the skb before using it, as the two other callers of the getter in
this file already do (j1939_session_tx_dat() returns -ENOBUFS, and
j1939_xtp_rx_dat_one() warns and cancels the session).  Nothing is warned
about here: a session completed with no data queued is a peer's protocol
error rather than a kernel one, and a netdev_warn() on this path would let
a peer flood the log.

Cancelling the session instead of dropping the completion may be the more
correct protocol behaviour; that is left alone deliberately, so this stays
a fix for the dereference.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was checked by hand against the code, the fault was reproduced on
net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary J1939 transport sessions unaffected.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/can/j1939/transport.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f..af54e6a6bd71 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1243,9 +1243,11 @@ static void j1939_session_completed(struct j1939_session *session)
 
 	if (!session->transmission) {
 		se_skb = j1939_session_skb_get(session);
-		/* distribute among j1939 receivers */
-		j1939_sk_recv(session->priv, se_skb);
-		consume_skb(se_skb);
+		if (se_skb) {
+			/* distribute among j1939 receivers */
+			j1939_sk_recv(session->priv, se_skb);
+			consume_skb(se_skb);
+		}
 	}
 
 	j1939_session_deactivate_activate_next(session);
-- 
2.34.1

