Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273732;
	b=EcFMMYCi0hSUxmMPjgJorJPrkQGX4XGc1EjIWYm9sxdV0khAHvInjOPAXSUboiEH5OaD
	 Sty2he4d96xYyQDM99yvXcfQLUovk0n8sygZjK5vYuiIuJVI1Vu7Ht+y5pExBh2uEFF04
	 rJpTfES1X/D+wXhjJV7gEbLm1ZtGB446A6ILNbfon6slOj5UU7e8Z5okkh4Uy7EhF7khq
	 R2RpdyW6j0S42FtuN4MJKNiqtHr34FdjE6aE6DwnOY9HDpj4fOjE+RgZFxkF42xWzJWeH
	 9lm5kqVLI3eDsuhfO8W0I0ltLfWN58vqpNc7ZA9/s0eW0j2KjSNIr5ubbWJze4fQGVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273732;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nf5dZ0QHcFOV0D3Tnm+2uIHAt+M9+9e/y454KmdyMH4=;
	b=lVTj50HBAwROz+EmNdrpsHP9FHozY+Q0PfTZPE5nbZjvK7DIdPlNkJj2ypGxde0znB/6
	 bUS45W3jgU+B1F/Srorb/ZmpptyL+SoreP+Ql0ss49KiSjjkjMaR76darGjUxmkr3sIFJ
	 JA1Yqr8L3RHQJYJp/NvOXuY1zYDMBHvdCuvpY78G84cay/I6qjYOnlyGAtIMKsi72RUIJ
	 48lvHSG+ZmbnqL4nhkvv6i4aaFZnvonILG9ST0707eNl+NIa2DOqEVaAn1X+1MBTezWE1
	 KHzZ2oDJuTpL2XJJ6CJHLRGkYgJBfuktNvKf6rraYsU9TakglBluPBXU9cYpkwEQUnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sC4WEbSQ;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871B606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 15:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B871B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=sC4WEbSQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795273727; x=1795532927;
	bh=nf5dZ0QHcFOV0D3Tnm+2uIHAt+M9+9e/y454KmdyMH4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sC4WEbSQDEe4bxH5Lrzw7jAXL6H4FjenF02AZmSLZxA7aeRV+PJcLlOm6G9msuLaj
	 9NHrM+AsAg/62SEHlkwtavHUGsDihn6lvf9oFn+UU6UDXzgXpM3hvGwzvx9hScIT/X
	 LFk2rgNj2r4NJU3ta6s+4iffnKwdu9Hf6JId+Jt36PeLcfhFjh4AYyw6DyWRmeLlyn
	 6SbX3f3NWHvyKpkqQLyDkBcaYo8mtCaK7AA4PgGTanMm4fhtWbSO8She9KpO+djLQN
	 KyonfSXsvciUW7WEPqvCPhozP1+BuhS7vSX/aHXfoqhKPnUcv557BMUDnhzmFY/ypB
	 +STm7gWUQpsPg==
Date: Sat, 21 Nov 2026 15:08:43 +0000
To: alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com
From: Lee Keon-Hyeong <leegun25@proton.me>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net] mac802154: take RTNL around ASSOC RESP transmission
Message-ID: <20261121150835.256812-1-leegun25@proton.me>
Feedback-ID: 167971190:user:proton
X-Pm-Message-ID: 526a5589f878115d95986fa28277bd3e46c7a6fb
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

mac802154_process_association_req() runs from the rx_mac_cmd workqueue.
The missing RTNL was identified during an LLM-assisted code audit of the
mac802154 association handling path.  The function builds the ASSOC RESP
and sends it through
mac802154_send_association_resp_locked() -> ieee802154_mlme_tx_locked(),
which asserts the RTNL and calls ieee802154_sync_queue().  The worker does
not hold the RTNL: this triggers an RTNL assertion failure whenever an
ASSOC REQ reaches the response transmission path.  With panic_on_warn=3D1 a
single unauthenticated frame panics the kernel, even with
max_associations=3D0 (a rejected request still sends a response).

Take the RTNL before association_lock, matching the netlink lock order
(RTNL then association_lock), and release it after the association lock on
all exits.

Reproduced with a monitor/coordinator pair on mac802154_hwsim; the same
test is silent with this patch.  On a CONFIG_PROVE_LOCKING kernel 86,891
association requests were sent while the coordinator was brought down and
up 1,200 times and recreated 71 times: no lockdep report, no hang and no
warning, and the longest down transition took about 4 ms.  The
panic_on_warn run (22,941 requests, 300 down/up cycles) also completed.
There is no in-tree selftest for this path; the checks above use a
dedicated hwsim harness.

Fixes: 601f160b61b2 ("mac802154: Handle association requests from peers")
Signed-off-by: Lee Keon-Hyeong <leegun25@proton.me>
---
 net/mac802154/scan.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/mac802154/scan.c b/net/mac802154/scan.c
index d393b1f4e..49bc5d29b 100644
--- a/net/mac802154/scan.c
+++ b/net/mac802154/scan.c
@@ -826,6 +826,11 @@ int mac802154_process_association_req(struct ieee80215=
4_sub_if_data *sdata,
 =09=09return -ENODEV;
 =09}
=20
+=09/* mac802154_send_association_resp_locked() uses the MLME TX helpers,
+=09 * which require the RTNL.  Take it before association_lock to keep the
+=09 * same lock order as the netlink paths (RTNL then association_lock).
+=09 */
+=09rtnl_lock();
 =09mutex_lock(&wpan_dev->association_lock);
=20
 =09memcpy(&assoc_req_pl, skb->data, sizeof(assoc_req_pl));
@@ -895,6 +900,7 @@ int mac802154_process_association_req(struct ieee802154=
_sub_if_data *sdata,
=20
 unlock:
 =09mutex_unlock(&wpan_dev->association_lock);
+=09rtnl_unlock();
 =09return ret;
 }
=20
--=20
2.55.0


