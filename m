Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554674;
	b=DxcBT99faZWeO0sXEvPebtXjqNTXk0iM60N7Z87E+3TRP9dBCVPS86JODDsi7qm4CH1Y
	 oCeiAOQeE5SZrbIKJNJDEkelzLx/lSOtqxfUPz6cVUar2ktUAeMCUHhl0F9dfNPQDlw5q
	 8SzDeXUoGwkwtwiUORz2FK+NgC76JWvlr9eefQ8da+cBjXueq07seoejBbKCTJgjrn0CB
	 p3REPTMEfYDglAGtLud+8EI0XGvyCEY3rprtFQSykOMQovXmszvMabzbu1Tqn2RnDTkVa
	 cPhSqcELYe7NceylpE5NblHvmK05RKnRbwHfsZBEVhRgv7yJ+jDuguZ98luL+Lz1lNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554674;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=G3HX/NcDKYG/LV94s9yi5wM3im9Q7+MV9lfJBW3/vZU=;
	b=vCbk3reAzM+lc1ZxKjNqotLEQl3lD4SpjPnBEMqJX44S3kbHXXSOfxr6KwdZYHJKdz/x
	 BsJmZm2ohCYgds1SWt0PRBze//hzRkjJtOD4HqWZTFd1fozIuYAy+k/AgNdcprDT2zfLf
	 4DErZfml/JyzE7qTvDi9BJc1aMnXISgXpwW5v52jU+TqNvUR/Hg1k2FKTjii+V9uTdyQU
	 LZ9N9A1glTFn1K99aFJtyOZZuG55Fp1ArtTrSIPMwwNJ39eF4f1hvaZF5s/CGfP14awfO
	 oUu5RKHloMt1wvcAXEKL2cjybjmjWTLQdI3xaycrR9dfYH7c14YmNgqSDx8x8pz92CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b="vJw/GS2u";
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F80606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=vJw/GS2u
Received: by dvalin.narfation.org (Postfix) id 5A49120277;
	Tue, 24 Nov 2026 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795554670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G3HX/NcDKYG/LV94s9yi5wM3im9Q7+MV9lfJBW3/vZU=;
	b=vJw/GS2uQ4vBOXvdZwwq6T6DsFagtRiFFeQinhjDYKxfBZrtbFzt/OoVmmyvKxjdBRX/Pt
	kCntGUbA15sGVBbHZNSV2s5tR55pZjVMnJkiaVBiYNPtRrTbooDPVilJmJnpeuoqPdvkRR
	rK6z6u1+A2i8BWd5msYsdtpGQMIHuuc=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 01/15] batman-adv: document refcount of returned objects
Date: Tue, 24 Nov 2026 22:11:07 +0100
Message-ID: <2939196.BEx9A2HvPv@sven-desktop>
In-Reply-To: <179554083742.3135.4885971613759489815@kernel.org>
References:
 <20261123171827.3294525-2-sw@simonwunderlich.de>
 <179554083742.3135.4885971613759489815@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart15895148.tv2OnDr8pf";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart15895148.tv2OnDr8pf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 22:11:07 +0100
Message-ID: <2939196.BEx9A2HvPv@sven-desktop>
In-Reply-To: <179554083742.3135.4885971613759489815@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:37 CET netdev-bot+sashiko@kernel.org wrote:
> Earlier, the message gives "(with increased refcnt)" as an example of
> wording that already documents this. The diff then removes that wording
> and rewrites it in batadv_gw_get_selected_gw_node(),
> batadv_gw_get_selected_orig(), batadv_hardif_get_by_netdev(),
> batadv_primary_if_get_selected(), batadv_orig_hash_find() and all of the
> netlink.c getters.
> 
> The same happens to "with an initialized reference counter" in
> batadv_tt_local_create() and batadv_tt_global_create(). It also happens to
> "it with an increased refcounter" in batadv_tt_global_orig_entry_find().
> 
> On the other hand, the other existing phrasing is left alone:
> 
>     * The object is returned with refcounter increased by 1.
> 
> It is still in batadv_orig_node_vlan_new(), batadv_orig_router_get(),
> batadv_orig_ifinfo_get(), batadv_orig_ifinfo_new(),
> batadv_neigh_ifinfo_get(), batadv_neigh_ifinfo_new() and
> batadv_last_bonding_get().


Will sync the remaining kernel-doc in a follow up patch: 

diff --git a/net/batman-adv/originator.c b/net/batman-adv/originator.c
index 25a3f78aca1a73cb484cfa038c0cd9151bc77d74..917bdbdd276a3a256f7d9778ea2fb9551fd5e62c 100644
--- a/net/batman-adv/originator.c
+++ b/net/batman-adv/originator.c
@@ -165,8 +165,7 @@ static bool batadv_vlan_id_valid(unsigned short vid)
  * Return: NULL in case of failure or the vlan object identified by vid and
  * belonging to orig_node otherwise. The object is created and added to the list
  * if it does not exist.
- *
- * The object is returned with refcounter increased by 1.
+ * The returned object has an increased refcounter.
  */
 struct batadv_orig_node_vlan *
 batadv_orig_node_vlan_new(struct batadv_orig_node *orig_node,
@@ -313,8 +312,7 @@ void batadv_neigh_node_release(struct kref *ref)
  *  the OGM should be sent to
  *
  * Return: the neighbor which should be the router for this orig_node/iface.
- *
- * The object is returned with refcounter increased by 1.
+ * The returned object has an increased refcounter.
  */
 struct batadv_neigh_node *
 batadv_orig_router_get(struct batadv_orig_node *orig_node,
@@ -373,8 +371,7 @@ batadv_orig_to_router(struct batadv_priv *bat_priv, const u8 *orig_addr,
  * @if_outgoing: the interface for which the ifinfo should be acquired
  *
  * Return: the requested orig_ifinfo or NULL if not found.
- *
- * The object is returned with refcounter increased by 1.
+ * The returned object has an increased refcounter.
  */
 struct batadv_orig_ifinfo *
 batadv_orig_ifinfo_get(struct batadv_orig_node *orig_node,
@@ -408,8 +405,7 @@ batadv_orig_ifinfo_get(struct batadv_orig_node *orig_node,
  * Return: NULL in case of failure or the orig_ifinfo object for the if_outgoing
  * interface otherwise. The object is created and added to the list
  * if it does not exist.
- *
- * The object is returned with refcounter increased by 1.
+ * The returned object has an increased refcounter.
  */
 struct batadv_orig_ifinfo *
 batadv_orig_ifinfo_new(struct batadv_orig_node *orig_node,
@@ -451,9 +447,8 @@ batadv_orig_ifinfo_new(struct batadv_orig_node *orig_node,
  * @neigh: the neigh node to be queried
  * @if_outgoing: the interface for which the ifinfo should be acquired
  *
- * The object is returned with refcounter increased by 1.
- *
- * Return: the requested neigh_ifinfo or NULL if not found
+ * Return: the requested neigh_ifinfo or NULL if not found.
+ * The returned object has an increased refcounter.
  */
 struct batadv_neigh_ifinfo *
 batadv_neigh_ifinfo_get(struct batadv_neigh_node *neigh,
@@ -487,8 +482,7 @@ batadv_neigh_ifinfo_get(struct batadv_neigh_node *neigh,
  * Return: NULL in case of failure or the neigh_ifinfo object for the
  * if_outgoing interface otherwise. The object is created and added to the list
  * if it does not exist.
- *
- * The object is returned with refcounter increased by 1.
+ * The returned object has an increased refcounter.
  */
 struct batadv_neigh_ifinfo *
 batadv_neigh_ifinfo_new(struct batadv_neigh_node *neigh,
diff --git a/net/batman-adv/routing.c b/net/batman-adv/routing.c
index 821fb5addbfe1dafa8a43e3ccf03032b4c5d8b16..73d9217afd1f29f5c7a0605cbf0a4cf94c8055c7 100644
--- a/net/batman-adv/routing.c
+++ b/net/batman-adv/routing.c
@@ -538,9 +538,8 @@ static int batadv_check_unicast_packet(struct batadv_priv *bat_priv,
  * batadv_last_bonding_get() - Get last_bonding_candidate of orig_node
  * @orig_node: originator node whose last bonding candidate should be retrieved
  *
- * Return: last bonding candidate of router or NULL if not found
- *
- * The object is returned with refcounter increased by 1.
+ * Return: last bonding candidate of router or NULL if not found.
+ * The returned object has an increased refcounter.
  */
 static struct batadv_orig_ifinfo * __must_check
 batadv_last_bonding_get(struct batadv_orig_node *orig_node)

Regards,
	Sven
--nextPart15895148.tv2OnDr8pf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawX9awAKCRBND3cr0xT1
y2CjAQCex3cOcPX3MfgI/UtuLP2yyWuXL9UBoTVAuIaPuHWHVwD/RSvamYy87WCZ
dDbg5rreYWNBTetQ6jYJ/sTtvH7Iugs=
=F+iV
-----END PGP SIGNATURE-----

--nextPart15895148.tv2OnDr8pf--



